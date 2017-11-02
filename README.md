# oystercard

Oyster card program features:

- Balance with maximum limit
- Calculates fares between zones
- Deducts penalty fares in case of touch in.out failure
- Records journey history - entry and exit stations


### Domain Models

| Object           | Messages      | Tests                   |
|:----------------:|:-------------:|:-----------------------:|
| card             | top_up money  | balance is 0 by default |
| card             | add money     |  
| card             | max limit     |  £ 90
=======

### Issue Comments:

NameError : Failure/Error
File path: ./spec/journey_spec.rb
Line number: 33
