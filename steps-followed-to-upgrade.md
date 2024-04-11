# Checklist
1. [ ] Go through `app` directory
2. [ ] Go through `resources` directory
3. [ ] Go through `database` directory
4. [ ] Check composer dependency and compatibility issue
5. [ ] Check npm packages dependencies


What have I done to upgrade from 5.6 to laravel 10
1. installed new laravel 10 project
2. replace app directory and fixed namespace
3. replace `resources/views`, `resources/assets`, `resources/landing` directory
4. fixed kernel.php class alias
5. add middleware in kernel
6. replace all namespace issues inside app directory for `Controllers`, `Models`, `Mails`, `Utilities`
7. replace all migrations and seeders 
8. fixed migrations and seeders namespace
9. added `UserSeeder` and `RoleUserSeeder` class
10. installed all composer dependencies one by one for project
11. fixed composer package `ultraware/roles` by linkup manually as this package is officially archived and has no support. That's why I added support for laravel 10 and link as composer dependency from `packages/roles` folder
12. installed necessary npm packages and fixed webpack cli issue for css, js compilation
13. added RouteServiceProvider namespace to load controllers in same way like before
14. improved code quality
15. added method code block, return type and so on
16. added database dumb file inside `db/xbot-db.sql` folder
17. initiated git support

These are the common steps followed for running with php 8.1



