
def pet_shop_name(name)
  return name[:name]
end

def total_cash(name)
  return name[:admin][:total_cash]
end

def add_or_remove_cash(name, amount)
  updated_total = name[:admin][:total_cash] += amount
  return updated_total
end

def pets_sold(name)
  return name[:admin][:pets_sold]
end

def increase_pets_sold(name, number)
  return name[:admin][:pets_sold] += number
end

def stock_count(name)
  return name[:pets].count
end

# def pets_by_breed(name, breed)
#   number = 0
#     for pet in name[:pets]
#       name[:pets][number][:breed] == breed
#       new_single_breed_array = (name[:pets][number][:breed])
#       end
#       number += 1
#     end
#   return new_single_breed_array
# end

def find_pet_by_name (name, pet_name)
     number = 0
     for pet in name[:pets]
       if name[:pets][number][:name] == pet_name
         new_single_pet_hash = name[:pets][number]
       end
       number += 1
     end
   return new_single_pet_hash
end

def remove_pet_by_name(name, pet_name)
  number = 0
    for pet in name[:pets]
      if name[:pets][number][:name] == pet_name
        name[:pets].delete_at(number)
      end
      number += 1
    end
  return
end

def add_pet_to_stock(name, new_pet)
name[:pets].push(new_pet)
  return stock_count(name)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  return customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
  return customer[:pets].count
end

def customer_can_afford_pet(customer, new_pet)
  if new_pet[:price] <= customer[:cash]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(name, pet, customer)
  if pet != nil
    while customer_can_afford_pet(customer, pet)
      customer[:pets].push(pet)
      name[:admin][:pets_sold] += 1
      customer[:cash] -= pet[:price]
      name[:admin][:total_cash] += pet[:price]
    end
  end
end
