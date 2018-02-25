# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
User.create!([{name: 'Admin',
               email: 'admin@woodendoor.com',
               password: 'adminpassword',
               password_confirmation: 'adminpassword',
               isAdmin: true,
               isRecruiter: false
              },
              {
                  name: 'Ashwin',
                  email: 'arisboo@ncsu.edu',
                  password: 'arisboo',
                  password_confirmation: 'arisboo',
                  isAdmin: false,
                  isRecruiter: false
              },
              {
                  name: 'Sameer',
                  email: 'spoudwa@ncsu.edu',
                  password: 'spoudwa',
                  password_confirmation: 'spoudwa',
                  isAdmin: false,
                  isRecruiter: false
              },
              {
                  name: 'Pranshu',
                  email: 'psinha@ncsu.edu',
                  password: 'psinha',
                  password_confirmation: 'psinha',
                  isAdmin: false,
                  isRecruiter: false
              },
              {
                  name: 'Google recruiter',
                  email: 'google_recruiter@google.com',
                  password: 'google',
                  password_confirmation: 'google',
                  isAdmin: false,
                  isRecruiter: true,
                  companyname: 'Google'
              },
              {
                  name: 'Facebook recruiter',
                  email: 'facebook_recruiter@facebook.com',
                  password: 'facebook',
                  password_confirmation: 'facebook',
                  isAdmin: false,
                  isRecruiter: true,
                  companyname: 'Facebook'
              }])
p "Created #{User.count} Users"

Company.destroy_all
Company.create!([{name: 'Google',
                  website: 'www.google.com',
                  Hq: 'San Francisco',
                  size: '5000',
                  Founded: '1983',
                  industry: 'Software',
                  revenue: '10000000',
                  synopsis: 'This is Google'
                 },
                 {name: 'Facebook',
                  website: 'www.facebook.com',
                  Hq: 'Menlo Park',
                  size: '1000',
                  Founded: '2000',
                  industry: 'Software',
                  revenue: '10000000',
                  synopsis: 'This is Facebook'
                 }])

p "Created #{Company.count} Companies"