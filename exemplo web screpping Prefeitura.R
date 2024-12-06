pip install requests beautifulsoup4


# Importação das bibliotecas necessárias
import requests
from bs4 import BeautifulSoup

# Definir a URL que será alvo do web scraping
url = "http://www.rondonopolis.mt.gov.br/"

try:
  # Fazer a requisição para a página
  response = requests.get(url)
response.raise_for_status()  # Verificar se houve erros na requisição

# Analisar o conteúdo HTML da página
soup = BeautifulSoup(response.text, 'html.parser')

# Extrair dados específicos
# Exemplo: Títulos dos artigos em um site
titles = soup.find_all('featured', class_='d-flex')

# Processar os dados extraídos
for index, title in enumerate(titles, start=1):
  print(f"{index}: {title.get_text(strip=True)}")

except requests.exceptions.RequestException as e:
  print(f"Erro ao acessar a URL: {e}")
