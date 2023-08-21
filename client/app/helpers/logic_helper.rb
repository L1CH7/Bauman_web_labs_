module LogicHelper
  # def self.get_inject(params)
  #   params.key?(:xslt) && (params[:xslt] == '1')
  # end

  # def self.get_server(params)
  #   get_inject(params) && \
  #     params.key?(:xslt_type) && \
  #     (params[:xslt_type] == 'server')
  # end

  # def self.get_client(params)
  #   get_inject(params) && \
  #     params.key?(:xslt_type) && \
  #     (params[:xslt_type] == 'client')
  # end

  # def self.get_rss(params)
  #   "http://[::1]:5000/logic/view.xml?number_a=#{params[:number_a]}&number_b=#{params[:number_b]}"
  # end
end
