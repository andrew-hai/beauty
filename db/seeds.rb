# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create(
  username: 'Andrew',
  email: 'andrey.melchenko@gmail.com',
  password: 12345678,
  role: User.roles[:super_admin]
)

first_category = Category.create(
  name: 'Ухода за лицом'
)

first_sub_category = SubCategory.create(
  name: 'Терапевтическая косметология',
  category: first_category
)

second_sub_category = SubCategory.create(
  name: 'Аппаратная косметология',
  category: first_category
)

second_category = Category.create(
  name: 'Уход за руками'
)

first_service = Service.create(
  name: 'Консультация врача',
  price: 2500,
  sub_category: first_sub_category
)

expert = Expert.create(
  full_name: 'Василий Пупкин',
  specialty: 'Врач дерматолог',
  experience: '10 лет работы где-то',
  description: 'Описание специалиста'
)

contact = Contact.create(
  work_hours: 'ПН-ПТ: 10:00-19:00',
  phone: 1234567890,
  email: 'fake@mail.com'
)

device = Device.create(
  fcm_token: 'test_token'
)

email_address = EmailAddress.create(
  email: 'fake@mail.com'
)
