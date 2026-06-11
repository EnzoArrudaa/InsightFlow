/* =====================================
   NEXUS AI - SCRIPT PRINCIPAL
===================================== */


/* ==============================
   NAVEGAÇÃO SPA
============================== */


const titles = {

dashboard:"Dashboard Geral",

ai:"IA Generativa - Consulta de Dados",

pipeline:"Pipeline de Dados",

vendas:"Análise de Vendas",

clientes:"Base de Clientes",

produtos:"Gestão de Produtos",

infra:"Infraestrutura AWS",

seguranca:"Segurança LGPD",

dataops:"DataOps e Qualidade"


};



function navigate(id,element){


document
.querySelectorAll(".page")
.forEach(page=>{

page.classList.remove("active");

});



document
.querySelectorAll(".nav-item")
.forEach(item=>{

item.classList.remove("active");

});




const page=document.getElementById(
"page-"+id
);



if(page){

page.classList.add("active");

}



if(element){

element.classList.add("active");

}




document
.getElementById("page-title")
.textContent=titles[id];



setTimeout(()=>{

initCharts(id);

},100);



}






/* ==============================
   GRÁFICOS
============================== */


const charts={};



function createChart(id,config){


const canvas=document.getElementById(id);


if(!canvas){

return;

}



if(charts[id]){

charts[id].destroy();

}



charts[id]=new Chart(
canvas,
config
);


}





function initCharts(page){



if(page!=="dashboard"){

return;

}





/* GRÁFICO DE FATURAMENTO */


createChart(
"revenueChart",
{


type:"bar",


data:{


labels:[

"Jun",
"Jul",
"Ago",
"Set",
"Out",
"Nov",
"Dez",
"Jan",
"Fev",
"Mar",
"Abr",
"Mai"

],



datasets:[{


label:"Receita (milhões)",


data:[

2.1,
2.4,
2.2,
2.8,
3.0,
3.2,
3.5,
3.1,
3.6,
3.8,
4.0,
4.2

],



backgroundColor:"#4d7fff"


}]

},


options:{


responsive:true,


maintainAspectRatio:false



}



}

);







/* GRÁFICO DE QUALIDADE */


createChart(
"qualityChart",

{


type:"radar",


data:{


labels:[

"Completude",
"Unicidade",
"Consistência",
"Precisão",
"Validade"

],


datasets:[{


label:"Qualidade %",


data:[

98,
99,
97,
98,
99

],



borderColor:"#18e6a8",


backgroundColor:
"rgba(24,230,168,.15)"

}]

},



options:{


responsive:true,


scales:{


r:{


min:90,


max:100


}



}



}



}

);



}









/* ==============================
   IA GENERATIVA
============================== */


const aiDatabase={



faturamento:{


text:"Analisando faturamento dos últimos meses...",


sql:`

SELECT

DATE_TRUNC('month', data) AS mes,

SUM(valor) AS faturamento

FROM vendas

GROUP BY mes

ORDER BY mes;

`,


result:

"📊 Crescimento de 18,3%. Total acumulado: R$22,4 milhões."

},






churn:{


text:"Executando análise de risco dos clientes...",


sql:`

SELECT

cliente_id,

nome,

churn_score

FROM clientes

WHERE churn_score > 0.6;

`,


result:

"⚠️ Encontrados 142 clientes com alto risco."

}



};






function getAIResponse(question){


question=question.toLowerCase();



if(

question.includes("faturamento") ||

question.includes("venda")

){


return aiDatabase.faturamento;


}




if(

question.includes("cliente") ||

question.includes("churn") ||

question.includes("risco")

){


return aiDatabase.churn;


}



return {


text:"Consulta analisada pela NEXUS IA.",


sql:

"SELECT * FROM gold_kpis;",


result:

"✅ Dados processados com sucesso."


};



}







function addMessage(
type,
text,
sql="",
result=""
){



const box=document.getElementById(
"chat-messages"
);



const div=document.createElement(
"div"
);



div.className="msg";




div.innerHTML=`

<div class="msg-avatar">

${type==="ai"?"AI":"US"}

</div>


<div class="msg-bubble">


${text}



${sql ?

`<pre style="
margin-top:10px;
color:#7a8aaa;
font-size:12px;
">
${sql}
</pre>`

:""}



${result ?

`<p style="
margin-top:10px;
color:#18e6a8;
">
${result}
</p>`

:""}



</div>

`;



box.appendChild(div);



box.scrollTop=box.scrollHeight;



}







function sendChat(){


const input=document.getElementById(
"chat-input"
);



if(!input.value.trim()){

return;

}




const question=input.value;


input.value="";



addMessage(
"user",
question
);




setTimeout(()=>{


const answer=getAIResponse(question);



addMessage(

"ai",

answer.text,

answer.sql,

answer.result

);



},800);



}

