# Vending Machine

Design a vending machine in code. The vending machine, once a product is selected and the appropriate amount of money (coins) is inserted, should return that product. It should also return change (coins) if too much money is provided or ask for more money (coins) if there is not enough. Keep in mind that you need to manage the scenario where the item is out of stock or the machine does not have enough change to return to the customer.
25c 50c 1$ 2$ 5$

## Getting Started

### Installation

Clone or download project. Install Gem dependencies.

```
bundle install
```

### Entry Point & Initialization

The vending machine entry point is app/vending_machine.rb. Initialized with the following products in inventory:

| Product Name  | Price         | Quantity|
| ------------- |:-------------:| -------:|
| Coca Cola     | $0.5          |    4    |
| Sprite        | $1.50         |    5    |
| Water         | $2.25         |    1    |
| Orange Juice  | $0.25         |    1    |

Initialized with the following coins:

| Coin | Quantity|
| -----|--------:|
| 0.25 | 1       |
| 0.50 | 1       |
| 1    | 2       |
| 1    | 2       |
| 2    | 1       |
| 5    | 1       |

To start the vending machine:

```
ruby app/vending_machine.rb
```

## Running the Tests

```
rspec
```

## Future Improvements

Future improvements if I had more time to work on this project:

* Redesign VendingMachine class - moving the logic responsible for comparing the balance and product price into a separate class
* Adding sales statistics
* Sending notifications if stocks of products or coins are running out
