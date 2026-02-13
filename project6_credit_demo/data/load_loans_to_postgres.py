import psycopg2

# Configuración de conexión
conn = psycopg2.connect(
    dbname="credito_demo", # Se crea antes en 01_create_Schema
    user="postgres",
    password="JamoncilloSQL",   # <-- la contra
    host="localhost",
    port="5432"
)

cursor = conn.cursor()

# Vaciar solo la tabla loan para evitar duplicados
# cursor.execute("TRUNCATE loan;")

# Ruta al archivo CSV de créditos
csv_path = r"C:\Users\edrua\sql-training\project6_credit_demo\data\loans.csv"

with open(csv_path, "r", encoding="utf-8") as f:
    next(f)  # saltar encabezado
    cursor.copy_from(
        f,
        "loan",
        sep=",",
        null="",
        columns=("loan_id", "customer_id", "amount", "interest_rate", "term_months", "start_date", "status")
    )

conn.commit()
cursor.close()
conn.close()

print("Créditos cargados correctamente en la tabla loan.")