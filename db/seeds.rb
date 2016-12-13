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
	email: 'felipaschwarz@gmail.com',
	password: '12345678', password_confirmation: '12345678'},

	{username: 'vschwarz',
	firstname: 'Vincent', lastname: 'Schwarz',
	email: 'vinc@gmail.com',
	password: '12345678', password_confirmation: '12345678'},

	{username: 'lenad',
	firstname: 'Lena', lastname: 'Dittrich',
	email: 'lena@dittrich.com',
	password: '12345678', password_confirmation: '12345678'},

	{username: 'nikos',
	firstname: 'Nikos', lastname: 'Schwarz',
	email: 'n@s.com',
	password: '12345678', password_confirmation: '12345678'},

	{username: 'laurins',
	firstname: 'Laurin', lastname: 'Summer',
	email: 'l@s.com',
	password: '12345678', password_confirmation: '12345678'}])