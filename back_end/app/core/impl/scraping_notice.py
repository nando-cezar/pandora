import requests

from flask_restful import abort
from app.core.scraping import Scraping
from bs4 import BeautifulSoup
import uuid


class ScrapingNotice(Scraping):

    def execute(self, **kwargs):

        base_url = 'https://news.google.com'
        search_path = '/search'

        params = {
            'q': kwargs['search'],
            'hl': kwargs['hl'],
            'gl': kwargs['gl'],
            'ceid': kwargs['ceid']
        }

        response = requests.get(f'{base_url}{search_path}', params=params)

        if response.status_code != 200:
            abort(404)

        soup = BeautifulSoup(response.content, 'html.parser')

        notices = soup.find_all('article', class_='IFHyqb DeXSAc')
        target_class1 = 'WwrzSb'
        target_class2 = 'JtKRv'
        target_class3 = 'K0q4G'
        target_class4 = 'hvbAAd'

        news_list = []

        for notice in notices:
            data_dict = {}
            _id = str(uuid.uuid1())
            data_dict['id'] = _id

            title_tag = notice.find('a', class_=target_class1)
            if title_tag:
                href = title_tag['href'][1:]
                data_dict['url'] = f'{base_url}{href}'

            title_tag = notice.find('a', class_=target_class2)
            if title_tag:
                data_dict['title'] = title_tag.text

            image_tag = notice.find('figure', class_=target_class3)
            if image_tag and image_tag.find('img'):
                src = image_tag.find('img')['src']
                data_dict['image'] = f'{base_url}{src}'

            date_tag = notice.find('time', class_=target_class4)
            if date_tag:
                data_dict['date'] = date_tag.text

            if data_dict:
                news_list.append(data_dict)

        return news_list if news_list else None
