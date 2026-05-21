LWEnum = LWEnum or {}

-- Zone type IDs passed to the zone native as the ZoneTypeId parameter.
LWEnum.ZoneType = {
    State       = 0,
    Town        = 1,
    Lake        = 2,
    River       = 3,
    Swamp       = 5,
    Ocean       = 6,
    Creek       = 7,
    Pond        = 8,
    District    = 10,
    TextPrinted = 11,
    TextWritten = 12,
}

-- States (ZoneTypeId 0).
-- The zone native always returns false for ZoneTypeId 0 — these values are
-- used as lookup targets in DistrictToState and for state-level identity
-- checks in consuming resources. Never passed to the engine directly.
LWEnum.State = {
    Ambarino           = 0xF2D2E4A4,
    NewHanover         = 0xB32957A3,
    Lemoyne            = 0x00A55D60,
    WestElizabeth      = 0x4A4BFEE7,
    LowerWestElizabeth = 0x8A606F74,
    UpperWestElizabeth = 0xB5AA074D,
    NewAustin          = 0x79E6A26B,
    Guarma             = 0x7356B8ED,

    -- Cut content — Mexico, inaccessible.
    NuevoParaiso       = 0x2496DFE4,
}

-- Towns (ZoneTypeId 1).
LWEnum.Town = {
    AguasdulcesFarm  = 0x62A26859,
    AguasdulcesRuins = 0x0BFD6F0A,
    AguasdulcesVilla = 0xB80C99B7,
    Annesburg        = 0x00704B67,
    Armadillo        = 0xD39FE932,
    BeechersHope     = 0x9A2C155A,
    Blackwater       = 0x3EC4B1F5,
    Braithwaite      = 0x6A07DAD2,
    Butcher          = 0x8BECCBA3,
    Caliga           = 0x6F0248BE,
    Cornwall         = 0x91A7512E,
    Emerald          = 0xE3CDCF62,
    Lagras           = 0x183CA5FA,
    Manicato         = 0x4D704A4B,
    Manzanita        = 0x57350B23,
    Rhodes           = 0x79FF6291,
    Sisika           = 0x7FFE0593,
    StDenis          = 0xD25EC74F,
    Strawberry       = 0x197DEE02,
    Tumbleweed       = 0xA51AF855,
    Valentine        = 0x1B6880B3,
    VanHorn          = 0x7EBD16BD,
    Wallace          = 0xCBFCD82E,
    Wapiti           = 0x632572AF,
}

-- Lakes (ZoneTypeId 2).
LWEnum.Lake = {
    AuroraBasin        = 0xF446F723,
    BarrowLagoon       = 0x2F6910A6,
    CalumetRavine      = 0x0DC99072,
    ElysianPool        = 0xF9B4B176,
    FlatIronLake       = 0xAF259737,
    HeartlandsOverflow = 0x68A0D069,
    LakeDonJulio       = 0xAE5A3E96,
    LakeIsabella       = 0x2350238D,
    OCreaughsRun       = 0x93A4FA9D,
    Owanjila           = 0xB27BFCD7,
    SeaOfCoronado      = 0xF13A02FD,
}

-- Rivers (ZoneTypeId 3).
LWEnum.River = {
    ArroyoDeLaVibora  = 0xFD09B97D,
    BeartoothBeck     = 0x26C17D4B,
    DakotaRiver       = 0x160ED9C7,
    KamassaRiver      = 0xB6B5E477,
    LannahecheeRiver  = 0x865D425D,
    LittleCreekRiver  = 0xABEF3DDB,
    LowerMontanaRiver = 0xB205F19C,
    SanLuisRiver      = 0xA65449E9,
    UpperMontanaRiver = 0x95D61B35,
}

-- Swamps (ZoneTypeId 5).
LWEnum.Swamp = {
    BayouNwa = 0xDEC86BB3,
}

-- Oceans (ZoneTypeId 6).
LWEnum.Ocean = {
    BahiaDeLaPaz = 0xBA5AB8E6,
}

-- Creeks (ZoneTypeId 7).
LWEnum.Creek = {
    DeadbootCreek   = 0x4A3C149D,
    DewberryCreek   = 0x1BF6CD08,
    HawksEyeCreek   = 0xB3E8D688,
    RingneckCreek   = 0x778DB1F6,
    SpiderGorge     = 0xF2F73626,
    StillwaterCreek = 0xB3407C3F,
    WhinyardStrait  = 0xF069309E,
}

-- Ponds (ZoneTypeId 8).
LWEnum.Pond = {
    CairnLake      = 0xC0068EB7,
    CattailPond    = 0xD007A6A7,
    HotSprings     = 0x460EA591,
    MattlockPond   = 0x11F25506,
    MoonstonePond  = 0xCF9DF96D,
    SouthfieldFlats = 0xCEE7ED14,
}

-- Districts (ZoneTypeId 10).
-- Cut content entries are included for completeness — they will never be
-- returned by the native on the playable map but are listed for documentation.
LWEnum.District = {
    -- Ambarino
    GrizzliesEast   = 0xF8D68DC1,
    GrizzliesWest   = 0x62162401,

    -- New Hanover
    Heartlands      = 0x07D4FF5F,
    roanoke         = 0x0AA5F25D,
    Cumberland      = 0x6D67801E,

    -- Lemoyne
    BayouNwa        = 0x78BFE1AC,
    BluewaterMarsh  = 0x4DFA0B50,
    scarlettMeadows = 0xCC7C3314,

    -- West Elizabeth
    bigvalley       = 0x3108C492,
    greatPlains     = 0x1C68EA97,
    TallTrees       = 0x6467EF09,

    -- New Austin
    ChollaSprings   = 0xF9831C72,
    GaptoothRidge   = 0x84D7AD0E,
    HennigansStead  = 0x35390B10,
    RioBravo        = 0x8016C23F,

    -- Guarma
    GuarmaD         = 0xE1736CD7,
    DiezCoronas     = 0x19700C95,
    PuntaOrgullo    = 0x56A7C746,

    -- Cut content — planned Mexico region, never shipped. Inaccessible on the
    -- playable map. Included so the native result can be handled gracefully
    -- if ever encountered.
    Perdido         = 0xB1531168,
}

-- Maps each district hash to its parent state hash.
-- All West Elizabeth districts map to the canonical WestElizabeth entry.
-- Perdido maps to NewAustin as the closest accessible geographic match.
LWEnum.DistrictToState = {
    -- Ambarino
    [LWEnum.District.GrizzliesEast]   = LWEnum.State.Ambarino,
    [LWEnum.District.GrizzliesWest]   = LWEnum.State.Ambarino,

    -- New Hanover
    [LWEnum.District.Heartlands]      = LWEnum.State.NewHanover,
    [LWEnum.District.roanoke]         = LWEnum.State.NewHanover,

    -- Lemoyne
    [LWEnum.District.BayouNwa]        = LWEnum.State.Lemoyne,
    [LWEnum.District.BluewaterMarsh]  = LWEnum.State.Lemoyne,
    [LWEnum.District.scarlettMeadows] = LWEnum.State.Lemoyne,

    -- West Elizabeth
    [LWEnum.District.bigvalley]       = LWEnum.State.WestElizabeth,
    [LWEnum.District.Cumberland]      = LWEnum.State.WestElizabeth,
    [LWEnum.District.greatPlains]     = LWEnum.State.WestElizabeth,
    [LWEnum.District.TallTrees]       = LWEnum.State.WestElizabeth,

    -- New Austin
    [LWEnum.District.ChollaSprings]   = LWEnum.State.NewAustin,
    [LWEnum.District.GaptoothRidge]   = LWEnum.State.NewAustin,
    [LWEnum.District.HennigansStead]  = LWEnum.State.NewAustin,
    [LWEnum.District.RioBravo]        = LWEnum.State.NewAustin,

    -- Guarma
    [LWEnum.District.GuarmaD]         = LWEnum.State.Guarma,
    [LWEnum.District.DiezCoronas]     = LWEnum.State.Guarma,
    [LWEnum.District.PuntaOrgullo]    = LWEnum.State.Guarma,

    -- Cut content
    [LWEnum.District.Perdido]         = LWEnum.State.NewAustin,
}

-- Named locations as printed on the map (ZoneTypeId 11).
LWEnum.TextPrinted = {
    BluewaterMarsh         = 0x93334804,
    AuroraBasin            = 0x47192461,
    BahiaDeLaPaz           = 0x9D32963D,
    BarrowLagoon           = 0x594D596C,
    CairnLake              = 0x233DD2DA,
    CattailPond            = 0x911B42FC,
    DakotaRiver            = 0xF7BC627C,
    DeadbootCreek          = 0x54898248,
    DewberryCreek          = 0xF37CEFEA,
    ElysianPool            = 0x6822C55D,
    ErisField              = 0x478F80B5,
    FlatIronLake           = 0x00DBDA50,
    HeartlandOilFields     = 0xC9C79854,
    HeartlandOverflow      = 0x7DC4A1C6,
    Lakay                  = 0x1BD5A429,
    LakeDonJulio           = 0x472F164A,
    LannahecheeRiver       = 0x5CE61D88,
    LittleCreekRiver       = 0x780F20F9,
    LowerMontanaRiver      = 0xC4270FE7,
    MattockPond            = 0x5D0900C3,
    MontosRest             = 0xB6F67FD4,
    MoonstonePond          = 0x63F6ACB4,
    MountHagen             = 0x6BA71EFC,
    OCreaughsRun           = 0x2BD2B4E6,
    Owanjila               = 0x5DCD45F1,
    RoanokeValley          = 0x58DB6580,
    SanLuisRiver           = 0x678A6057,
    SeaOfCoronado          = 0xE29827A8,
    SouthfieldFlats        = 0xE78CB65F,
    SpiderGorge            = 0x649E4CEF,
    StillwaterCreek        = 0xBD5364C5,
    UpperMontanaRiver      = 0x4E98B0E9,
    WhinyardStrait         = 0x9640BA83,
    Aguasdulces            = 0xB32BD1BD,
    Armadillo              = 0xE6EAEFF7,
    ArroyoDeLaVibora       = 0xCD5CE9A2,
    BacchusBridge          = 0x0C52C6A8,
    BacchusStation         = 0xCBF9C0AF,
    BardsCrossing          = 0x9CFF54C5,
    BeartoothBeck          = 0xB76E9142,
    BenedictPass           = 0x57DBD9B8,
    BenedictPoint          = 0xD3920730,
    Blackwater             = 0xC87D8B8A,
    BolgerGlade            = 0xFBFEE55C,
    BraithwaiteManor       = 0xF60E3AED,
    CalibansSeat           = 0x222E5CED,
    CaligaHall             = 0x7C43315A,
    CalumetRavine          = 0x192F0A3E,
    CincoTorres            = 0x871DB74E,
    CitadelRock            = 0xAF900BFB,
    CotorraSprings         = 0xC69E4B94,
    CumberlandFalls        = 0xE325C1F3,
    DiabloRidge            = 0x3DB72923,
    DonnerFalls            = 0x7500A60F,
    EmeraldRanch           = 0x14DE5EA9,
    FlatneckStation        = 0xCD806933,
    FortMercer             = 0xC22A2C44,
    FortWallace            = 0xFA0BEEA7,
    GranitePass            = 0xBD8B165E,
    HawksEyeCreek          = 0xD5457035,
    JorgesGap              = 0x785538B2,
    KamassaRiver           = 0x5F15C77C,
    LaCapilla              = 0x3FFC8A8F,
    Lagras                 = 0x3552B0DE,
    LakeIsabella           = 0x31941238,
    MacfarlanesRanch       = 0xA4A17FBD,
    MantecaFalls           = 0xB84137A2,
    ManzanitaPost          = 0x2279EE5F,
    MercerStation          = 0xF6AD913C,
    MountShann             = 0x20B2D466,
    OwanjilaDam            = 0xAB5763FF,
    Plainview              = 0x109B730C,
    QuakersCove            = 0x2AF9F7C1,
    RathskellerFork        = 0xCC796CBD,
    Rhodes                 = 0x4DD509F6,
    RiggsStation           = 0x2DDEDE9F,
    RingneckCreek          = 0x695D3BFE,
    RioDelLoboRock         = 0x6EE4B99E,
    SaintDenis             = 0x009BA3DC,
    SisikaPenitentiary     = 0x41F983C2,
    TempestRim             = 0x867F0549,
    ThievesLanding         = 0x35DCE61E,
    ThreeSisters           = 0x8D2C1E7E,
    Tumbleweed             = 0x85D4C0D0,
    TwinRocks              = 0x89764F23,
    TwinStackPass          = 0x3BD66C97,
    Valentine              = 0x960B8448,
    VanHornTradingPost     = 0x9E9E3406,
    WallaceStation         = 0x56A56E44,
    WindowRock             = 0x4A4C3F63,
    BrandywineDrop         = 0x40B8C6F2,
    EmeraldStation         = 0xB69452F7,
    Strawberry             = 0xEB56F48B,
    WapitiIndianReservation = 0xD423D45C,
    Annesburg              = 0x88B34053,
}

-- Named locations as written on the map (ZoneTypeId 12).
LWEnum.TextWritten = {
    AbandonedMission       = 0xD1113443,
    AbandonedTradingPost   = 0x44CE7B03,
    AberdeenPigFarm        = 0x0D0F2B79,
    AdlerRanch             = 0xC1CD737F,
    AppleseedTimberCompany = 0xE6F7DBF9,
    BaygallEdge            = 0x0BE5C4CF,
    BearClaw               = 0xF035FC69,
    BeechersHope           = 0x63F741E1,
    BrittlebrushTrawl      = 0xC9592823,
    ButcherCreek           = 0xE6A471EB,
    CairnLodge             = 0x88CA196B,
    CanebreakManor         = 0x229D05AC,
    CarmodyDell            = 0x8EA16502,
    CastorsRidge           = 0xDB1A94C6,
    CatfishJacksons        = 0x656FB687,
    CentralUnionRailroad1  = 0x20144315,
    CentralUnionRailroad2  = 0x5CDBBCA3,
    CentralUnionRailroad3  = 0x4A98181C,
    ChezPorter             = 0x86BE76ED,
    ClawsonsRest           = 0x620D6F83,
    ClemensPoint           = 0x6D17AC2F,
    Clingman               = 0x767DC860,
    Cochinay               = 0x1321E567,
    Colter                 = 0xA6CC7164,
    CompsonsStead          = 0x1F24B6AE,
    CootsChapel            = 0xFC5A9494,
    CopperheadLanding      = 0x40815011,
    CornwallKeroseneTar    = 0x1D5BC2A5,
    CrawdadWillies         = 0xBA9A795B,
    CuevaSeca              = 0x4A606200,
    DoddsBluff             = 0x96933878,
    DorminCrest            = 0xC88AA5E6,
    Doverhill              = 0xD98BB81D,
    DownesRanch            = 0xD8D62973,
    ElNido                 = 0x18E91D1B,
    EvelynMillerCamp       = 0x3D67DD7C,
    EwingBasin             = 0xDF753206,
    FaceRock               = 0x9372C764,
    FairvaleShanty         = 0x9F50855A,
    FireLookoutTower       = 0xD3A671FC,
    FirwoodRise            = 0xF7453243,
    FlattenedCabin         = 0x565B032F,
    FortRiggsHoldingCamp   = 0xCE9BA997,
    GaptoothBreach         = 0x026256CA,
    GillLanding            = 0xFF6DBCB4,
    GrangersHoggery        = 0xCC18EFF5,
    Greenhollow            = 0x729C12AF,
    GuthrieFarm            = 0xA83D828C,
    HagenOrchards          = 0x01D5FAC3,
    HangingDogRanch        = 0xF9D63EB6,
    HanisBethel            = 0x2202EE4D,
    HillHavenRanch         = 0x96872368,
    HorseshoeOverlook      = 0xAEF74FB9,
    Houseboat              = 0x70F74B60,
    LakeDonJulioHouse      = 0x9B1E5B7F,
    LarnedSod              = 0x695954DA,
    LoneMuleStead          = 0xDD9EFEE5,
    LonniesShack           = 0x2DF010E2,
    LuckysCabin            = 0x0DAD94D2,
    MacleansHouse          = 0xA11AEDB9,
    MacombsEnd             = 0x3F53BC77,
    ManitoGlade            = 0x55A6D12B,
    MarthasSwain           = 0x300DE595,
    MerkinsWaller          = 0x5082CF03,
    MeteorHouse            = 0x8C3CD7F3,
    MicahsHideout          = 0x59D077AC,
    MillesaniClaim         = 0x7F1C3407,
    MossyFlats             = 0x3C93944A,
    NekotiRock             = 0x1667C7A9,
    OddfellowsRest         = 0xDA5FA6D8,
    OilDerrick             = 0x4DEBB513,
    OldGreenbankMill       = 0xEEA64B2B,
    OldHarryFen            = 0x5055B4E0,
    OldTomsBlind           = 0x5F8E4341,
    OldTrailRise           = 0xF32CB01B,
    OsmanGrove             = 0x15673770,
    PaintedSky             = 0xA54B8915,
    PikesBasin             = 0xEBEF68EE,
    PlantersBawn           = 0x9AAED2F4,
    Pleasance              = 0x353AC7BD,
    PleasanceHouse         = 0x86B12D24,
    PrinzCo                = 0x6EE5C62B,
    PronghornRanch         = 0xF8D01ECE,
    RattlesnakeHollow      = 0x58105158,
    Repentance             = 0x43BCB764,
    RidgeView              = 0xD0BA4C63,
    RidgewoodFarm          = 0x5C0805AB,
    RileysCharge           = 0x2C0B51CA,
    RioDelLoboHouse        = 0xB5A7CAAE,
    RoadsideBrothel        = 0x664A6EF4,
    RobardFarm             = 0x53800035,
    SawboneClearing        = 0x3292E8D5,
    ScratchingPost         = 0x005E5CEB,
    ShadyBelle             = 0x33A0D3EC,
    ShepherdsRise          = 0xE1F57D42,
    SilentStead            = 0xCC3A1981,
    SiltwaterStrand        = 0x377AB2F9,
    SixPointCabin          = 0x7A9A9F57,
    SolomonsFolly          = 0x345C766C,
    StillwaterCabin        = 0x6F889F10,
    StiltShack             = 0x4135DBBC,
    SwadbassPoint          = 0xBE7D779C,
    TannersReach           = 0xAB5E835F,
    TaxidermistHouse       = 0x8F1BCA55,
    TheHangingRock         = 0x01DDD396,
    TheLoft                = 0xE5D84B79,
    TheOldBacchusPlace     = 0xBA0B2C82,
    TradingPost            = 0x845CED96,
    TrappersCabin          = 0x163AE1E1,
    TwoCrows               = 0x80DC09EC,
    UtopianColonyBuilding  = 0xD21EE891,
    VanHornMansion         = 0x34863110,
    VentersPlace           = 0x0783569F,
    VeteransHomestead      = 0x3BAF424F,
    WallaceOverlook        = 0x65994796,
    WatsonsCabin           = 0xBAC9B3A9,
    WillardsRest           = 0xF6C518EB,
    WitchesCauldron        = 0x3375B1D2,
    ArgilRise              = 0x0EA363C9,
    BeaverHollow           = 0xF7B0EB8A,
    BerylsDream            = 0x4848054E,
    BlackBalsamRise        = 0xC62FFBC6,
    BlackBoneForest        = 0xA43C8951,
    BrokenTree             = 0x81417DA0,
    ChadwickFarm           = 0xCF732CFE,
    DeerCottage            = 0x298A013E,
    Fishingspot            = 0x7C690B35,
    FortBrennand           = 0x97800BD2,
    GrandKorriganDocked    = 0x88CD8123,
    GrandKorriganSea       = 0x603377B9,
    HuronGlen              = 0x0DC39324,
    LenoraView             = 0x3FE3547E,
    Limpany                = 0xCE67AF12,
    RadleysPasture         = 0xF0840204,
    ValleyView             = 0x292C5252,
    VettersEcho            = 0x5511F36C,
    RadleysHouse           = 0x7678268D,
    ReedCottage            = 0x59607054,
}