extends Node

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

var resources = {
	"materials": 0,
	"gold": 0,
	"science": 0
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
var passivlySavedRelics := 0.0
var passiveFoodIncome := 0.0
var automaticShelterBuilder := false
var automaticShelterImprover := false
var villagerWorkMultiplier := 1.0
var amountOfResearchDone := 0

var factoryVisible = false
var hospitalVisible = false
var bankVisibile = false

var food := 0.0
var shelters := 0
var shelterExpansions := 0
var savedRelics := 0.0
var savedRelictsMultiplier := 1.0
var savedTech := 0.0
var completedIdols := 0.0


func reset():
	resources = {
		"materials": 0,
		"gold": 0,
		"science": 0
	}
	resourcesMultiplier = {
		"materials": 1,
		"gold": 1,
		"science": 1
	}
	researchProgress = {
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
	passiveScienceIncome = 0
	passiveGoldIncome = 0
	passiveMaterialsIncome = 0
	passiveSavedRelics = 0.0
	passiveFoodIncome = 0.0
	automaticShelterBuilder = false
	automaticShelterImprover = false
	villagerWorkMultiplier = 1.0
	amountOfResearchDone = 0
	factoryVisible = false
	hospitalVisible = false
	bankVisibile = false
	food = 0.0
	shelters = 0
	shelterExpansions = 0
	savedRelics = 0.0
	savedRelictsMultiplier = 1.0
	savedTech = 0.0
	completedIdols = 0.0

var stats := []
