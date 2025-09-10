import psycopg2

# Configuración de conexión
conn = psycopg2.connect(
    dbname="derechos_humanos",
    user="postgres",
    password="JamoncilloSQL",   # <-- cámbiala por la de tu PostgreSQL
    host="localhost",
    port="5432"
)

cursor = conn.cursor()

# Vaciar la tabla antes de insertar para evitar duplicados
cursor.execute("TRUNCATE complaint;")

# Ruta al archivo CSV (ajusta la ruta si tu carpeta es distinta)
csv_path = r"C:\Users\edrua\sql-training\project5_human_rights_cases\data\complaints.csv"

with open(csv_path, "r", encoding="utf-8") as f:
    next(f)  # saltar línea de encabezado
    cursor.copy_from(
        f,
        "complaint",
        sep=",",
        null="",
        columns=("complaint_id", "received_date", "right_id", "mun_id", "area_id", "status", "description")
    )

conn.commit()
cursor.close()
conn.close()

print("✅ Datos insertados correctamente en la tabla complaint.")