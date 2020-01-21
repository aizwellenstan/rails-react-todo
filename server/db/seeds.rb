# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
User.create(
    username: '5xruby',
    password: '5xruby520'
)

Task.create(
    text: 'task1',
    start_time: '20190118',
    end_time: '20190119',
    level: 'H',
    status: 'active',
    tags: ''
)

Task.create(
    text: 'task2',
    start_time: '20190118',
    end_time: '20190119',
    level: 'M',
    status: 'passive',
    tags: ''
)