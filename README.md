# ask me

![RubyOnRails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)

Приложение-клон ask.fm, в котором вы можете задавать вопросы и получать ответы.

В дополнение к этому реализовано:

* Система хештегов
* Выбор цвета профиля
* Аватарки с помощью gravatar 

#### Запуск программы:

* Скопируйте репозиторий:

```
git clone git@github.com:Spola1/askme_gp.git
```

* Войдите в папку с игрой:

```
cd askme_gp
```

* Установите библиотеки:

```
bundle install
```

* Скопируйте содержимое .env.example в .env и пропишите туда свои ключи

```
cp .env.example .env
```

>__.env__
>```
>  RECAPTCHA_ASKME_PUBLIC_KEY=
>  RECAPTCHA_ASKME_PRIVATE_KEY=
>```


* Запустите миграции:

```
rails db:migrate
```

Запустите сервер:

```
rails s
```
