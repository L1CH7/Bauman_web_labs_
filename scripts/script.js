function printList( position ) {
    data = position.tagName;
    console.log( 'ENTER ' + position.tagName );
    if ( position.childElementCount > 0 ) {
        data += "<ul>";
        for ( var i = 0; i < position.children.length; ++i ) {
            data += "<li>" + printList( position.children[i] ) + "</li>";
        }
        data += "</ul>";
    }
    console.log( 'LEAVE ' + position.tagName );
    return data;
}

document.getElementById( "my_list" ).innerHTML += printList( document.documentElement );

data = "";
for ( let i = 2010; i > 1949; --i) {
    data += "<option>" + i + "</option>";
}
document.getElementById( "year" ).innerHTML = data;
//document.getElementById( "year" ).appendChild(data);