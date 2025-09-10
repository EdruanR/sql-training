import csv
import random
from faker import Faker

fake = Faker('es_MX')   # Faker en español México

# Configuración
NUM_ROWS = 10000  # <-- ahora generaremos DIEZ MIL quejas
START_YEAR = "-5y"   # últimos 5 años (desde 2019)

# Catálogos de referencia
rights = {
    1: "Derecho a la vida",
    2: "Derecho a la educación",
    3: "Derecho a la salud",
    4: "Derecho al agua",
    5: "Derecho al trabajo",
    6: "Derecho a la no discriminación",
    7: "Derecho a la seguridad"
}

municipalities = {
    1: "León",
    2: "Irapuato",
    3: "Salamanca",
    4: "Celaya",
    5: "Guanajuato",
    6: "Dolores Hidalgo",
    7: "San Miguel de Allende"
}

areas = {
    1: "Atención Ciudadana",
    2: "Jurídico",
    3: "Mediación",
    4: "Archivo",
    5: "Dirección General"
}

statuses = ["ABIERTO", "EN PROCESO", "CERRADO"]

# Generar CSV
with open("project5_human_rights_cases/data/complaints.csv", "w", newline="", encoding="utf-8") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["complaint_id", "received_date", "right_id", "mun_id", "area_id", "status", "description"])
    
    for i in range(1, NUM_ROWS + 1):
        # Fechas distribuidas entre los últimos 5 años
        received_date = fake.date_between(start_date=START_YEAR, end_date="today")
        
        right_id = random.choice(list(rights.keys()))
        mun_id = random.choice(list(municipalities.keys()))
        area_id = random.choice(list(areas.keys()))
        status = random.choice(statuses)
        description = fake.sentence(nb_words=10)
        
        writer.writerow([i, received_date, right_id, mun_id, area_id, status, description])

print(f"✅ Archivo complaints.csv generado con {NUM_ROWS} registros (últimos 5 años).")