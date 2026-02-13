import csv
import random
from faker import Faker

fake = Faker('es_MX')

NUM_LOANS = 3000  # cantidad de créditos a generar
CUSTOMERS = 1000  # coincide con el número de clientes que generaste

statuses = ["VIGENTE", "CANCELADO", "MOROSO"]

with open("project6_credit_demo/data/loans.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["loan_id", "customer_id", "amount", "interest_rate", "term_months", "start_date", "status"])

    for loan_id in range(1, NUM_LOANS + 1):
        customer_id = random.randint(1, CUSTOMERS)
        amount = round(random.uniform(3000, 200000), 2)          # monto del crédito
        interest_rate = round(random.uniform(8, 45), 2)          # tasa anual en %
        term_months = random.choice([6, 12, 18, 24, 36, 48, 60]) # plazo en meses
        start_date = fake.date_between(start_date="-5y", end_date="today")
        status = random.choices(
            statuses,
            weights=[0.6, 0.25, 0.15],  # mayoría vigentes, algunos cancelados, algunos morosos
            k=1
        )[0]

        writer.writerow([loan_id, customer_id, amount, interest_rate, term_months, start_date, status])

print("loans.csv generado.")