
# Weather or Not

A weather application using the [Flutter](https://flutter.dev/) Framework by Google. All Weather Data is fetched from the OpenWeatherMap API with different subscription options available depending on project requirements. 

## Authors

- [@bmteasdale](https://www.github.com/bmteasdale)

  
## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`API_KEY`

This 'API_KEY' is supplied by [OpenWeatherMap API](https://openweathermap.org/api) for both free and paid account types.

  
## Dependencies

| Package Name       | Version     | Description                                                                                          |
| :----------------- | :---------- | :--------------------------------------------------------------------------------------------------- |
| `cupertino_icons`  | `^1.0.2`    |  Default set of icon assets used by Flutter's Cupertino widgets.                                     |
| `geocoding`        | `^1.0.5`    |  Retrieve address from lat and lon.                                                                  |
| `geolocator`       | `^6.1.1`    |  Retrieve lat and lon from device location. (Permissions Required)                                   |
| `intl`             | `^0.17.0`   |  Provides internationalization and localization.                                                     |
| `get`              | `^4.1.4`    |  State & Route Management.                                                                           |
| `http`             | `^0.13.3`   |  Future-based library for making HTTP requests.                                                      |
| `flutter_dotenv`   | `^5.0.0`    |  Load configuration at runtime from a .env file.                                                     |
| `pull_to_refresh`  | `^2.0.0`    |  Refresh ListView Widgets with pull down.                                                            |
| `get_storage`      | `^2.0.2`    |  A fast, light and synchronous key-value in memory, which backs up data to disk at each operation.   |


## API Reference
I chose to subscribe to the 'One Call API'. The API calls below are specific to that subscription with the path `/onecall?`. If you choose a different subscription, just note that your call may be different.

#### Get All Weather Data:

```bash
  GET https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&appid={API key}
```

| Parameter | Type     | Description                     |
| :-------- | :------- | :------------------------------ |
| `lat`     | `string` | **Required**. Latitude Position |
| `lat`     | `string` | **Required**. Longitude Position|
| `api_key` | `string` | **Required**. Your API key      |

#### If you wish to specify the units of measurements:

```bash
  GET https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&units={units}&appid={API key}
```

| Parameter | Type     | Description                         |
| :-------- | :------- | :---------------------------------- |
| `lat`     | `string` | **Required**. Latitude Position     |
| `lat`     | `string` | **Required**. Longitude Position    |
| `units`   | `string` |  Units (Standard, Imperial, Metric) |
| `api_key` | `string` | **Required**. Your API key          |

#### If you wish to omit specific parts of the weather data from the API response:

```bash
  GET https://api.openweathermap.org/data/2.5/onecall?lat={lat}&lon={lon}&exclude={parts}&units={units}&appid={API key}
```

| Parameter | Type     | Description                               |
| :-------- | :------- | :---------------------------------------- |
| `lat`     | `string` | **Required**. Latitude Position           |
| `lat`     | `string` | **Required**. Longitude Position          |
| `exclude` | `list`   |  List of data to be omitted from response |
| `units`   | `string` |  Units (Standard, Imperial, Metric)       |
| `api_key` | `string` | **Required**. Your API key                |
  
> *Note*: `units` parameter should be a comma seperated list ***without spaces***. Possible list values are:
> - `current`
> - `minutely`
> - `hourly`
> - `daily`
> - `alerts`  

## Run Locally

Clone the project

```bash
$ git clone https://github.com/bmteasdale/weatherapp.git
```

Go to the project directory

```bash
$ cd weatherapp
```

Install dependencies

```bash
$ flutter pub get
```

Run application after opening a mobile simulator

```bash
$ flutter run
```