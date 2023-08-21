# frozen_string_literal: true

require 'net/http'
require 'nokogiri'

# a logic controller class
class LogicController < ApplicationController
  def viewer; end

  def result
    @xml = get_xml_remotely(params[:number_a], params[:number_b])
    if params[:convert_type] == 'server' # server
      xslt = Nokogiri::XSLT(File.read('public/format.xslt'))
      params[:xslt] == '1' ? (render html: xslt.transform(@xml).to_s.html_safe) : (render plain: @xml) # 1-xslt, 0-xml
    else # client
      @xml.root.add_previous_sibling Nokogiri::XML::ProcessingInstruction.new(@xml, 'xml-stylesheet',
                                                                              'type="text/xsl" href="/format.xslt"')
      params[:xslt] == '1' ? (render xml: @xml) : (render plain: @xml) # 1 is xslt, 0 is xml
    end
  end

  def get_xml_remotely(a, b)
    url = URI.parse("http://127.0.0.1:5000/logic/view.xml?number_a=#{a}&number_b=#{b}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
    @answer = res
    Nokogiri::XML(res.body)
  end
end
