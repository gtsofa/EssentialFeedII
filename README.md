# API

[![CI-iOS](https://github.com/gtsofa/EssentialFeedII/actions/workflows/CI-iOS.yml/badge.svg)](https://github.com/gtsofa/EssentialFeedII/actions/workflows/CI-iOS.yml)
[![CI-macOS](https://github.com/gtsofa/EssentialFeedII/actions/workflows/CI-macOS.yml/badge.svg)](https://github.com/gtsofa/EssentialFeedII/actions/workflows/CI-macOS.yml)

## Backlog
- [x] Model Specs
- [x] Payload Contract
- [x] Model Specs
- [x] App model specs
- [ ] UI model specs (viewmodel)
- [x] BDD and Use Cases

### Model Specs

 Feed Item

| Property  | Type  | 
| :------------ |:---------------:|
| id  | UUID |
| descprition    | String (Optional) |
| location | String (Optional) |
| imageURL | URL | 

### Payload contract

```
GET **url* (TBD)

200 RESPONSE

{
	"items": [
		{
			"id": "a UUID",
			"description": "a description",
			"location": "a location",
			"image": "https://a-image.url",
		},
		{
			"id": "another UUID",
			"description": "another description",
			"image": "https://another-image.url"
		},
		{
			"id": "even another UUID",
			"location": "even another location",
			"image": "https://even-another-image.url"
		},
		{
			"id": "yet another UUID",
			"image": "https://yet-another-image.url"
		}
		...
	]
}

```

# Use Cases

## Load Feed From Remote Use Case

### Data:
- URL

### Primary course (happy path)
1. Execute "Load Image Feed" command with above data.
2. System downloads data from the URL.
3. System validates downloaded data.
4. System creates image feed from valid data.
5. System delivers image feed.

### Invalid data – error course (sad path):
1. System delivers invalid data error.

### No connectivity – error course (sad path):
1. System delivers connectivity error.

### Tasks - To be put on trello and progress be monitored!
- [x] URL
- [x] Execute "Load Image Feed" command with above data
- [x] System downloads data from the URL.
- [x] System validates downloaded data.
- [x] System creates image feed from valid data.
- [x] System delivers image feed.