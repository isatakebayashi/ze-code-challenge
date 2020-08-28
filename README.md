# README

## Dependencies

* `docker`
* `docker-compose`

#### Installation instructions

* [docker](https://docs.docker.com/install/)
* [docker-compose](https://docs.docker.com/compose/install/)

## Setting up the project

Make sure you have installed all dependencies and then run `docker-compose build`

## Running tests
To run specs, use: `docker-compose run app rspec`

## Project URL

Project runs on `localhost:3000`. You can change this by editing
`docker-compose.yml` file.

## Running local

Run `docker-compose up`

Polulate database: `docker-compose run app rake import:partners_data`

## Testing local by graphql

- Create a partner:
```
mutation{
  createPartner(input: {
    id: "4",
    tradingName: "bananas",
    ownerName: "pacoas",
    document: "1432132123891/0001",
    coverageArea: {
      type: "MultiPolygon",
      coordinates: [
      	[[[30, 20], [45, 40], [10, 40], [30, 20]]],
      	[[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
      ]
    },
    address: {
      type: "Point",
      coordinates: [-46.57421, -21.785741]
    }
  }) {
    id
  }
}
```

- Search a partner by id:
```
query {
  partner(id: "7") {
		ownerName
    tradingName
    document
    coverageArea {
      type
      coordinates
    }
    address {
      type
      coordinates
    }
  }
}
```

- Search the nearest partner by latitude and longitude:
```
query {
  findPartners(lat: -46.57421, long: -21.785741) {
		id
    ownerName
    tradingName
    document
    coverageArea {
      type
      coordinates
    }
    address {
      type
      coordinates
    }
  }
}
```
