var sum = 0;

    
function add(elem){
    nm = elem.children[0].innerText;
    cst = elem.children[1].innerText;
    sum += Number(cst);
    var tbody = document.getElementById("tbd");
    var row = document.createElement("tr");
    var td1 = document.createElement("td");
    td1.innerHTML = nm;
    var td2 = document.createElement("td");
    td2.innerHTML = cst;
    row.appendChild(td1);
    row.appendChild(td2);
    tbody.appendChild(row);
}

function summ(){
    document.getElementById("calc-res").innerText = sum;
}

