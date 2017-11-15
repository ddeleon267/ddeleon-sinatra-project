dom = User.create(username: "ddeleon267", email: "ddeleon267@test.com", password: "password1")
routine_1 = Routine.create(name: "Fall Morning", description: "Some description")
routine_1.routine_products << RoutineProduct.create(routine_id: 1, product_id: 1)
routine_1.routine_products << RoutineProduct.create(routine_id: 1, product_id: 2)
routine_1.routine_products << RoutineProduct.create(routine_id: 1, product_id: 3)
dom.routines << routine_1
dom.save

routine_2 = Routine.create(name: "Fall Evening", description: "Some description")
routine_2.routine_products << RoutineProduct.create(routine_id: 2, product_id: 4)
routine_2.routine_products << RoutineProduct.create(routine_id: 2, product_id: 5)
routine_2.routine_products << RoutineProduct.create(routine_id: 2, product_id: 6)
dom.routines << routine_2
dom.save

nicole = User.create(username: "domtastic1", email: "domtastic1@test.com", password: "password2")
routine_3 = Routine.create(name: "Fall Morning", description: "Some description")
routine_3.routine_products << RoutineProduct.create(routine_id: 3, product_id: 7)
routine_3.routine_products << RoutineProduct.create(routine_id: 3, product_id: 8)
routine_3.routine_products << RoutineProduct.create(routine_id: 3, product_id: 9)
nicole.routines << routine_3
nicole.save

Product.create(name: "Gentle Cleanser A", category: "Cleanser", ingredients: "Some ingredients", notes: "Appropriate pH" )
Product.create(name: "Lightweight Moisturizer A", category: "Moisturizer", ingredients: "Some ingredients", notes: "Silicone free" )
Product.create(name: "Chemical Sunscreen", category: "Sunscreen", ingredients: "Some ingredients", notes: "Strong fragrance" )
Product.create(name: "Gentle Cleanser B", category: "Cleanser", ingredients: "Some ingredients", notes: "Appropriate pH" )
Product.create(name: "Toner A", category: "Toner", ingredients: "Some ingredients", notes: "Very Moisturizing" )
Product.create(name: "Heavy Moisturizer A", category: "Moisturizer", ingredients: "Some ingredients", notes: "Great occlusive" )
Product.create(name: "Toner B", category: "Toner", ingredients: "Some ingredients", notes: "Not astringent at all" )
Product.create(name: "Lightweight Moisturizer B", category: "Moisturizer", ingredients: "Some ingredients", notes: "Some essential oils" )
Product.create(name: "Combination Sunscreen", category: "Sunscreen", ingredients: "Some ingredients", notes: "Not greasy at all" )
Product.create(name: "Gentle Cleanser C", category: "Cleanser", ingredients: "Some ingredients", notes: "Appropriate pH" )
Product.create(name: "Lightweight Moisturizer C", category: "Moisturizer", ingredients: "Some ingredients", notes: "Feels like nothing" )
Product.create(name: "Heavy Moisturizer B", category: "Moisturizer", ingredients: "Some ingredients", notes: "Not recommended for acne-prone skin" )
Product.create(name: "Heavy Moisturizer C", category: "Moisturizer", ingredients: "Some ingredients", notes: "Dries down matte" )
Product.create(name: "Toner C", category: "Toner", ingredients: "Some ingredients", notes: "Tingles a little" )
Product.create(name: "Physical Sunscreen", category: "Sunscreen", ingredients: "Some ingredients", notes: "Minimal white cast" )
