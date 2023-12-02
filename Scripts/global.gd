extends Node

var resources = {
	"materials": 2000,
	"gold": 2000,
	"science": 2000
}

var resourcesMultiplier = {
	"materials": 1,
	"gold": 1,
	"science": 1
}

var researchProgress = {
	"res1" = false,
	"res2" = false,
	"res3" = false,
	"res4" = false,
	"res11" = false,
	"res12" = false,
	"res21" = false,
	"res22" = false,
	"res31" = false,
	"res32" = false,
}

var passiveScienceIncome := 0
var passiveGoldIncome := 0
var passiveMaterialsIncome := 0
var passiveSavedRelics := 0.0
var passiveFoodIncome := 0.0
var automaticShelterBuilder := false
var automaticShelterImprover := false
var villagerWorkMultiplier := 1.0
var amountOfResearchDone := 0

var food := 0
var shelters := 0
var shelterExpansions := 0
var savedRelics := 0.0
var savedRelictsMultiplier := 1.0
var savedTech := 0.0
var completedIdols := 0.0

const GRAIN_INCREASE = 2
const MEAT_INCREASE = 3
const PLANTS_INCREASE = 4
const GRAIN_VALUE = 1
const MEAT_VALUE = 2
const PLANTS_VALUE = 3

const EXPANSION_INCREASE = 3
const SHELTER_INCREASE = 2

const LITERATURE_INCREASE := 1
const ART_INCREASE := 2
const SCULPTURE_INCREASE := 3

const VILLAGERS_INCREASE := 8
