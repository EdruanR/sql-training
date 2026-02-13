import psycopg2

# Configuración de conexión
conn = psycopg2.connect(
    dbname="credito_demo",
    user="postgres",
    password="JamoncilloSQL",
    host="localhost",
    port="5432"
)

cursor = conn.cursor()

# Vaciar la tabla antes de cargar (para evitar duplicados)
# cursor.execute("TRUNCATE customer;")

# Ruta al CSV de clientes
csv_path = r"C:\Users\edrua\sql-training\project6_credit_demo\data\customers.csv"

with open(csv_path, "r", encoding="utf-8") as f:
    next(f)  # saltar encabezado
    cursor.copy_from(
        f,
        "customer",
        sep=",",
        null="",
        columns=("customer_id", "gender", "age", "income_monthly", "employment_status")
    )

conn.commit()
cursor.close()
conn.close()

print("Clientes cargados correctamente en la tabla customer.")