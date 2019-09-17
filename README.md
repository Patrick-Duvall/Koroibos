# Koroibos

## About 

## Schema

## Endpoints

### GET api/v1/olympians
Returns a list of all olympians in the following format:
```javascript
{
  "olympians":
    [
      {
        "name": "Maha Abdalsalam",
        "team": "Egypt",
        "age": 18,
        "sport": "Diving"
        "total_medals_won": 0
      },
      {
        "name": "Ahmad Abughaush",
        "team": "Jordan",
        "age": 20,
        "sport": "Taekwondo"
        "total_medals_won": 1
      },
      {...}
    ]
}
```
- Also supports age query params for `api/v1/olympians?age=oldest` and `api/v1/olympians?age=youngest` to return the oldest and youngest olympians

### GET api/v1/olympian_stats
Returns stats about all olympians in the format:
```javascript
  {
    "olympian_stats": {
      "total_competing_olympians": 3120
      "average_weight:" {
        "unit": "kg",
        "male_olympians": 75.4,
        "female_olympians": 70.2
      }
      "average_age:" 26.2
    }
  }
```

### `GET api/v1/events`
Returns an index of all sports and their associated Events inthe following format:
```javascript
//Response Format
{
  "events":
    [
      {
        "sport": "Archery",
        "events": [
          "Archery Men's Individual",
          "Archery Men's Team",
          "Archery Women's Individual",
          "Archery Women's Team"
        ]
      },
      {
        "sport": "Badminton",
        "events": [
          "Badminton Men's Doubles",
          "Badminton Men's Singles",
          "Badminton Women's Doubles",
          "Badminton Women's Singles",
          "Badminton Mixed Doubles"
        ]
      },
      {...}
    ]
}
```

### `GET api/v1/events/:id/medalists`
Returns all available medalists from the sample data for an event in the following format:
```javascript
{
  "event": "Badminton Mixed Doubles",
  "medalists": [
      {
        "name": "Tontowi Ahmad",
        "team": "Indonesia-1",
        "age": 29,
        "medal": "Gold"
      },
      {
        "name": "Chan Peng Soon",
        "team": "Malaysia",
        "age": 28,
        "medal": "Silver"
      }
    ]
}
```
- Returns 404 if event not found
### `GET api/v1/medal_count`
Returns all countries and their medal count in the following format:
```javascript
{
  "countries": [
    { 
      "name": "United States",
      ""medals": {
        "gold": 3,
        "silver": 6,
        "bronze": 5
      }
    },
     { 
      "name": "Japan",
      "medals": {
        "gold": 2,
        "silver": 0,
        "bronze": 3
      }
    },
    {...}
  ]
}

```


