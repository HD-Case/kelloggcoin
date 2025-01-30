# Cryptocurrency is all the rage. You have decided to create your own,
# KelloggCoin, that will massively disrupt financial markets at the Global
# Hub.

# Don't change the following code, which represents a series of transactions, each
# of which represents a transfer of KelloggCoin from one user to another – transactions 
# with no from_user are from the "ICO" (Initial Coin Offering)

blockchain = [
  { "from_user" => nil, "to_user" => "ben", "amount" => 20000 },
  { "from_user" => nil, "to_user" => "brian", "amount" => 20000 },
  { "from_user" => "ben", "to_user" => "evan", "amount" => 9000 },
  { "from_user" => "brian", "to_user" => "anthony", "amount" => 7000 },
  { "from_user" => "evan", "to_user" => "anthony", "amount" => 400 },
  { "from_user" => "ben", "to_user" => "anthony", "amount" => 1500 },
  { "from_user" => "anthony", "to_user" => "ben", "amount" => 4500 },
  { "from_user" => "anthony", "to_user" => "evan", "amount" => 1750 }
]

# Write code below that returns the number of KelloggCoin that each user has in their 
# KelloggCoin "wallet".

# It should print out:
# Ben's KelloggCoin balance is 14000
# Brian's KelloggCoin balance is 13000
# Evan's KelloggCoin balance is 10350
# Anthony's KelloggCoin balance is 2650

# 👇👇👇 Your code HERE 👇👇👇
unique_names = []

'''blockchain.each do |transfer|
  puts transfer["to_user"]
end'''

blockchain.each do |transfer|
  ["from_user", "to_user"].each do |key|
    if transfer[key] && !transfer[key].empty? && !unique_names.include?(transfer[key])
      unique_names << transfer[key]
    end
  end
end

wallets = {} #track each user's wallet

unique_names.each do |name|
  wallets[name] = 0  # Set each user's wallet balance to 0
end

blockchain.each do |transfer|
  from_user = transfer["from_user"]
  to_user = transfer["to_user"]
  amount = transfer["amount"]

  if from_user && !from_user.empty?
    wallets[from_user] -= amount
  end

  wallets[to_user] += amount

end

wallets.each do |name, balance|
  puts "#{name}'s KelloggCoin balance is #{balance}"
end
