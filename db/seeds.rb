# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
	{username: 'fschwarziii',
	firstname: 'Felipa', lastname: 'Schwarz',
	address_1: 'Am Brühlbach 14', city: 'Göppingen', country: 'Germany',
	email: 'felipaschwarz@gmail.com',
	password: 'hello12345678', password_confirmation: 'hello12345678'},

	{username: 'vschwarz',
	firstname: 'Vincent', lastname: 'Schwarz',
	address_1: 'Seitzstraße 9', address_2: '3. Stock', city: 'München', state: 'Bayern', country: 'Germany',
	email: 'vinc@gmail.com',
	password: 'abc12345678', password_confirmation: 'abc12345678'},

	{username: 'lenad',
	firstname: 'Lena', lastname: 'Dittrich',
	address_1: 'Calle de Ayala 16', city: 'Madrid', country: 'Spain',
	email: 'lena@dittrich.com',
	password: 'password123', password_confirmation: 'password123'}])