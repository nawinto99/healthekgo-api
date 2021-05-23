# Healthekgo
All of India's healthcare services and public data are available under one roof, with a single (EK) click and quick access to data. Healthcare Eco, single click, data quick 

## Demo
 <img src="./public/healthekgo-api-demo.gif" alt="profile"/>
- Logon to

  https://www.graphqlbin.com/v2/new
- Enter Endpoint

  https://api.healthekgo.online/v1/graphql
  
 - Example:
 ```javascript
query {
  States (where: {stateCode: {_eq: "28"}}) {
    stateCode
    stateName
    Districts (where: {districtCode: {_eq: "550"}})
    {
      districtName
      Cities 
      {
        cityName
        Areas
        {
          areaName
        }
      }
    }
  }
}
```

## Authors

- [Naveen Thurimerla](https://www.github.com/nawinto99)

## Support

For support, email nawinto99@gmail.com  
## License

[MIT](https://github.com/nawinto99/plusma-app/blob/main/LICENSE)

  
