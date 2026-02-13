import csv
import random
from faker import Faker

fake = Faker('es_MX')

NUM_CUSTOMERS = 1000  # número de clientes

employment_statuses = ["EMPLEADO", "DESEMPLEADO", "INDEPENDIENTE", "ESTUDIANTE"]

with open("project6_credit_demo/data/customers.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["customer_id", "gender", "age", "income_monthly", "employment_status"])

    for i in range(1, NUM_CUSTOMERS + 1):
        gender = random.choice(["MASCULINO", "FEMENINO"])
        age = random.randint(18, 75)
        income = round(random.uniform(3000, 60000), 2)
        employment = random.choice(employment_statuses)

        writer.writerow([i, gender, age, income, employment])

print("customers.csv generado.")