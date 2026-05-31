import mysql.connector
import pandas as pd
from sklearn.linear_model import LinearRegression

# conexão MySQL
conexao = mysql.connector.connect(
    host="localhost",
    user="root",
    password="enzogabriel2006@",
    database="ecommerce_db"
)

# lendo dados
query = "SELECT * FROM pedidos"
df = pd.read_sql(query, conexao)

# faturamento total
print("\nFaturamento Total:")
print(round(df["preco_venda"].sum(), 2))

media_avaliacao = df["avaliacao"].mean()

print("\nMÉDIA DE AVALIAÇÃO")
print(round(media_avaliacao, 2))

# top 5 faturamento
print("\nTOP 5 PRODUTOS POR FATURAMENTO")
print(
    df.groupby("produto_modelo")["preco_venda"]
    .sum()
    .sort_values(ascending=False)
    .head(5)
)

devolucoes = (df["devolucao"] == "Sim").sum()

print("TOTAL DE DEVOLUÇÕES")
print(devolucoes)


entregas_prazo = (
    (df["status_logistica"] == "Entregue no Prazo").mean() * 100
)

print("ENTREGAS NO PRAZO")
print(round(entregas_prazo, 2), "%")


# machine learning
df["id_numero"] = range(1, len(df) + 1)

X = df[["id_numero"]]
y = df["preco_venda"]

modelo = LinearRegression()

modelo.fit(X, y)

proxima = pd.DataFrame({
    "id_numero": [len(df) + 1]
})

previsao = modelo.predict(proxima)

print("\nPREVISÃO PRÓXIMA VENDA")
print("R$", round(previsao[0], 2))

# fechar conexão
conexao.close()