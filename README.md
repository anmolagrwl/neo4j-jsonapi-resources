# Peeps: A demo of JSONAPI-Resources with Neo4j.rb gem

Peeps is a very basic contact management system implemented as an API that follows the JSON API spec.


The instructions below were used to create this app.


## Steps to run this app

### Clone this app

```bash
git clone https://github.com/anmolonruby/neo4j-jsonapi-resources
```

### Run the following rake tasks

```bash
rake neo4j:install && rake neo4j:start && rake db:seed
```
This will install Neo4j, start the Neo4j server and create some seed data.

### Start the Rails app

In terminal/command prompt, enter `rails s`

### Open Contact or Phone Number API in browser

Open these links:

1. Request - `http://localhost:3000/contacts`

  Response -

  ```
  {
    "data": {
      "id": "57461821-2819-4f77-9054-d464a014d3a2",
      "type": "contacts",
      "links": {
        "self": "\/contacts\/57461821-2819-4f77-9054-d464a014d3a2"
      },
      "attributes": {
        "name-first": "John",
        "name-last": "Doe",
        "email": "johndoe@example.com",
        "twitter": "johndoe"
      },
      "relationships": {
        "phone-numbers": {
          "links": {
            "self": "\/contacts\/57461821-2819-4f77-9054-d464a014d3a2\/relationships\/phone-numbers",
            "related": "\/contacts\/57461821-2819-4f77-9054-d464a014d3a2\/phone-numbers"
          }
        }
      }
    }
  }
  ```

2. Request - `http://localhost:3000/phone-numbers`

  Response -

  ```
  {
    "data": {
      "id": "4d18e4f5-d504-463e-a4db-a1a7abc2f90a",
      "type": "phone-numbers",
      "links": {
        "self": "\/phone-numbers\/4d18e4f5-d504-463e-a4db-a1a7abc2f90a"
      },
      "attributes": {
        "name": "John Doe",
        "phone-number": "1234567890"
      },
      "relationships": {
        "contact": {
          "links": {
            "self": "\/phone-numbers\/4d18e4f5-d504-463e-a4db-a1a7abc2f90a\/relationships\/contact",
            "related": "\/phone-numbers\/4d18e4f5-d504-463e-a4db-a1a7abc2f90a\/contact"
          }
        }
      }
    }
  }
  ```

### Other ways to interact with the application

  1. Through Neo4j server

    Open `localhost:7474` in browser, this opens up Neo4j's server. Enter the following command in the console at the top to see the Nodes and Relationships:

      `MATCH (n) RETURN n`

  2. Through Rails console:

    In separate terminal/ command prompt, enter `rails c`

    ```bash
    Loading development environment (Rails 4.2.2)
2.2.1 :001 > Contact
 => Contact(email: Object, name_first: Object, name_last: Object, twitter: Object)
2.2.1 :002 > PhoneNumber
 => PhoneNumber(name: Object, phone_number: Object)
2.2.1 :003 > Contact.first
 CYPHER 19ms MATCH (n:`Contact`) RETURN n ORDER BY n.uuid LIMIT {limit_1} | {:limit_1=>1}
 => #<Contact uuid: "57461821-2819-4f77-9054-d464a014d3a2", email: "johndoe@example.com", name_first: "John", name_last: "Doe", twitter: "johndoe">
2.2.1 :004 > PhoneNumber.first
 CYPHER 14ms MATCH (n:`PhoneNumber`) RETURN n ORDER BY n.uuid LIMIT {limit_1} | {:limit_1=>1}
 => #<PhoneNumber uuid: "4d18e4f5-d504-463e-a4db-a1a7abc2f90a", name: "John Doe", phone_number: "1234567890">
2.2.1 :005 > Contact.first.phone_numbers
 CYPHER 9ms MATCH (n:`Contact`) RETURN n ORDER BY n.uuid LIMIT {limit_1} | {:limit_1=>1}
 => #<AssociationProxy @query_proxy=#<QueryProxy Contact#phone_numbers CYPHER: "MATCH contact5 WHERE (ID(contact5) = {ID_contact5}) MATCH contact5-[rel1:`HAS_PHONE`]->(result_phone_numbers:`PhoneNumber`)">>
2.2.1 :006 > PhoneNumber.first.contact
 CYPHER 14ms MATCH (n:`PhoneNumber`) RETURN n ORDER BY n.uuid LIMIT {limit_1} | {:limit_1=>1}
 PhoneNumber#contact 92ms MATCH phonenumber6 WHERE (ID(phonenumber6) = {ID_phonenumber6}) MATCH phonenumber6<-[rel1:`HAS_PHONE`]-(result_contact:`Contact`) RETURN result_contact | {:ID_phonenumber6=>6}
 => #<Contact uuid: "57461821-2819-4f77-9054-d464a014d3a2", email: "johndoe@example.com", name_first: "John", name_last: "Doe", twitter: "johndoe">
 2.2.1 :007 > Contact.all
  => #<QueryProxy Contact CYPHER: "MATCH (n:`Contact`)">
 2.2.1 :008 > Contact.all.count
  Contact 70ms MATCH (n:`Contact`) RETURN count(n) AS n
  => 1
    ```

    To understand the above queries, you will have to go through wiki of Neo4j.rb gem, which you can find here - https://github.com/neo4jrb/neo4j/wiki. Here, we just queried for the node and traversed the relationships.
