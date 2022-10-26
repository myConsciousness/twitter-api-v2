// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_withheld_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserWithheldEvent _$$_UserWithheldEventFromJson(Map json) => $checkedCreate(
      r'_$_UserWithheldEvent',
      json,
      ($checkedConvert) {
        final val = _$_UserWithheldEvent(
          user: $checkedConvert(
              'user',
              (v) =>
                  UserEventData.fromJson(Map<String, Object?>.from(v as Map))),
          withheldInCountries: $checkedConvert(
              'withheld_in_countries',
              (v) => (v as List<dynamic>)
                  .map((e) => $enumDecode(_$ISOAlpha2CountryEnumMap, e))
                  .toList()),
          eventAt:
              $checkedConvert('event_at', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
      fieldKeyMap: const {
        'withheldInCountries': 'withheld_in_countries',
        'eventAt': 'event_at'
      },
    );

Map<String, dynamic> _$$_UserWithheldEventToJson(
        _$_UserWithheldEvent instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'withheld_in_countries': instance.withheldInCountries
          .map((e) => _$ISOAlpha2CountryEnumMap[e]!)
          .toList(),
      'event_at': instance.eventAt.toIso8601String(),
    };

const _$ISOAlpha2CountryEnumMap = {
  ISOAlpha2Country.afghanistan: 'AF',
  ISOAlpha2Country.alandIslands: 'AX',
  ISOAlpha2Country.albania: 'AL',
  ISOAlpha2Country.algeria: 'DZ',
  ISOAlpha2Country.americanSamoa: 'AS',
  ISOAlpha2Country.andorra: 'AD',
  ISOAlpha2Country.angola: 'AO',
  ISOAlpha2Country.anguilla: 'AI',
  ISOAlpha2Country.antarctica: 'AQ',
  ISOAlpha2Country.antiguaAndBarbuda: 'AG',
  ISOAlpha2Country.argentina: 'AR',
  ISOAlpha2Country.armenia: 'AM',
  ISOAlpha2Country.aruba: 'AW',
  ISOAlpha2Country.australia: 'AU',
  ISOAlpha2Country.austria: 'AT',
  ISOAlpha2Country.azerbaijan: 'AZ',
  ISOAlpha2Country.bahamas: 'BS',
  ISOAlpha2Country.bahrain: 'BH',
  ISOAlpha2Country.bangladesh: 'BD',
  ISOAlpha2Country.barbados: 'BB',
  ISOAlpha2Country.belarus: 'BY',
  ISOAlpha2Country.belgium: 'BE',
  ISOAlpha2Country.belize: 'BZ',
  ISOAlpha2Country.benin: 'BJ',
  ISOAlpha2Country.bermuda: 'BM',
  ISOAlpha2Country.bhutan: 'BT',
  ISOAlpha2Country.bolivia: 'BO',
  ISOAlpha2Country.bonaire: 'BQ',
  ISOAlpha2Country.bosniaAndHerzegovina: 'BA',
  ISOAlpha2Country.botswana: 'BW',
  ISOAlpha2Country.bouvetIsland: 'BV',
  ISOAlpha2Country.brazil: 'BR',
  ISOAlpha2Country.britishIndianOceanTerritory: 'IO',
  ISOAlpha2Country.bruneiDarussalam: 'BN',
  ISOAlpha2Country.bulgaria: 'BG',
  ISOAlpha2Country.burkinaFaso: 'BF',
  ISOAlpha2Country.burundi: 'BI',
  ISOAlpha2Country.cambodia: 'KH',
  ISOAlpha2Country.cameroon: 'CM',
  ISOAlpha2Country.canada: 'CA',
  ISOAlpha2Country.capeVerde: 'CV',
  ISOAlpha2Country.caymanIslands: 'KY',
  ISOAlpha2Country.centralAfricanRepublic: 'CF',
  ISOAlpha2Country.chad: 'TD',
  ISOAlpha2Country.chile: 'CL',
  ISOAlpha2Country.china: 'CN',
  ISOAlpha2Country.christmasIsland: 'CX',
  ISOAlpha2Country.cocosIslands: 'CC',
  ISOAlpha2Country.colombia: 'CO',
  ISOAlpha2Country.comoros: 'KM',
  ISOAlpha2Country.congo: 'CD',
  ISOAlpha2Country.cookIslands: 'CK',
  ISOAlpha2Country.costaRica: 'CR',
  ISOAlpha2Country.ivoryCoast: 'CI',
  ISOAlpha2Country.croatia: 'HR',
  ISOAlpha2Country.cuba: 'CU',
  ISOAlpha2Country.curacao: 'CW',
  ISOAlpha2Country.cyprus: 'CY',
  ISOAlpha2Country.czechRepublic: 'CZ',
  ISOAlpha2Country.denmark: 'DK',
  ISOAlpha2Country.djibouti: 'DJ',
  ISOAlpha2Country.dominica: 'DM',
  ISOAlpha2Country.dominicanRepublic: 'DO',
  ISOAlpha2Country.ecuador: 'EC',
  ISOAlpha2Country.egypt: 'EG',
  ISOAlpha2Country.elSalvador: 'SV',
  ISOAlpha2Country.equatorialGuinea: 'GQ',
  ISOAlpha2Country.eritrea: 'ER',
  ISOAlpha2Country.estonia: 'EE',
  ISOAlpha2Country.ethiopia: 'ET',
  ISOAlpha2Country.falklandIslands: 'FK',
  ISOAlpha2Country.faroeIslands: 'FO',
  ISOAlpha2Country.fiji: 'FJ',
  ISOAlpha2Country.finland: 'FI',
  ISOAlpha2Country.france: 'FR',
  ISOAlpha2Country.frenchGuiana: 'GF',
  ISOAlpha2Country.frenchPolynesia: 'PF',
  ISOAlpha2Country.frenchSouthernTerritories: 'TF',
  ISOAlpha2Country.gabon: 'GA',
  ISOAlpha2Country.gambia: 'GM',
  ISOAlpha2Country.georgia: 'GE',
  ISOAlpha2Country.germany: 'DE',
  ISOAlpha2Country.ghana: 'GH',
  ISOAlpha2Country.gibraltar: 'GI',
  ISOAlpha2Country.greece: 'GR',
  ISOAlpha2Country.greenland: 'GL',
  ISOAlpha2Country.grenada: 'GD',
  ISOAlpha2Country.guadeloupe: 'GP',
  ISOAlpha2Country.guam: 'GU',
  ISOAlpha2Country.guatemala: 'GT',
  ISOAlpha2Country.guernsey: 'GG',
  ISOAlpha2Country.guinea: 'GN',
  ISOAlpha2Country.guineaBissau: 'GW',
  ISOAlpha2Country.guyana: 'GY',
  ISOAlpha2Country.haiti: 'HT',
  ISOAlpha2Country.heardIslandAndMcDonaldIslands: 'HM',
  ISOAlpha2Country.holySee: 'VA',
  ISOAlpha2Country.honduras: 'HN',
  ISOAlpha2Country.hongKong: 'HK',
  ISOAlpha2Country.hungary: 'HU',
  ISOAlpha2Country.iceland: 'IS',
  ISOAlpha2Country.india: 'IN',
  ISOAlpha2Country.indonesia: 'ID',
  ISOAlpha2Country.iran: 'IR',
  ISOAlpha2Country.iraq: 'IQ',
  ISOAlpha2Country.ireland: 'IE',
  ISOAlpha2Country.isleOfMan: 'IM',
  ISOAlpha2Country.israel: 'IL',
  ISOAlpha2Country.italy: 'IT',
  ISOAlpha2Country.jamaica: 'JM',
  ISOAlpha2Country.japan: 'JP',
  ISOAlpha2Country.jersey: 'JE',
  ISOAlpha2Country.jordan: 'JO',
  ISOAlpha2Country.kazakhstan: 'KZ',
  ISOAlpha2Country.kenya: 'KE',
  ISOAlpha2Country.kiribati: 'KI',
  ISOAlpha2Country.korea: 'KR',
  ISOAlpha2Country.kuwait: 'KW',
  ISOAlpha2Country.kyrgyzstan: 'KG',
  ISOAlpha2Country.laoPeoplesDemocraticRepublic: 'LA',
  ISOAlpha2Country.latvia: 'LV',
  ISOAlpha2Country.lebanon: 'LB',
  ISOAlpha2Country.lesotho: 'LS',
  ISOAlpha2Country.liberia: 'LR',
  ISOAlpha2Country.libya: 'LY',
  ISOAlpha2Country.liechtenstein: 'LI',
  ISOAlpha2Country.lithuania: 'LT',
  ISOAlpha2Country.luxembourg: 'LU',
  ISOAlpha2Country.macao: 'MO',
  ISOAlpha2Country.macedonia: 'MK',
  ISOAlpha2Country.madagascar: 'MG',
  ISOAlpha2Country.malawi: 'MW',
  ISOAlpha2Country.malaysia: 'MY',
  ISOAlpha2Country.maldives: 'MV',
  ISOAlpha2Country.mali: 'ML',
  ISOAlpha2Country.malta: 'MT',
  ISOAlpha2Country.marshallIslands: 'MH',
  ISOAlpha2Country.martinique: 'MQ',
  ISOAlpha2Country.mauritania: 'MR',
  ISOAlpha2Country.mauritius: 'MU',
  ISOAlpha2Country.mayotte: 'YT',
  ISOAlpha2Country.mexico: 'MX',
  ISOAlpha2Country.micronesia: 'FM',
  ISOAlpha2Country.moldova: 'MD',
  ISOAlpha2Country.monaco: 'MC',
  ISOAlpha2Country.mongolia: 'MN',
  ISOAlpha2Country.montenegro: 'ME',
  ISOAlpha2Country.montserrat: 'MS',
  ISOAlpha2Country.morocco: 'MA',
  ISOAlpha2Country.mozambique: 'MZ',
  ISOAlpha2Country.myanmar: 'MM',
  ISOAlpha2Country.namibia: 'NA',
  ISOAlpha2Country.nauru: 'NR',
  ISOAlpha2Country.nepal: 'NP',
  ISOAlpha2Country.netherlands: 'NL',
  ISOAlpha2Country.newCaledonia: 'NC',
  ISOAlpha2Country.newZealand: 'NZ',
  ISOAlpha2Country.nicaragua: 'NI',
  ISOAlpha2Country.niger: 'NE',
  ISOAlpha2Country.nigeria: 'NG',
  ISOAlpha2Country.niue: 'NU',
  ISOAlpha2Country.norfolkIsland: 'NF',
  ISOAlpha2Country.northernMarianaIslands: 'MP',
  ISOAlpha2Country.norway: 'NO',
  ISOAlpha2Country.oman: 'OM',
  ISOAlpha2Country.pakistan: 'PK',
  ISOAlpha2Country.palau: 'PW',
  ISOAlpha2Country.palestine: 'PS',
  ISOAlpha2Country.panama: 'PA',
  ISOAlpha2Country.papuaNewGuinea: 'PG',
  ISOAlpha2Country.paraguay: 'PY',
  ISOAlpha2Country.peru: 'PE',
  ISOAlpha2Country.philippines: 'PH',
  ISOAlpha2Country.pitcairn: 'PN',
  ISOAlpha2Country.poland: 'PL',
  ISOAlpha2Country.portugal: 'PT',
  ISOAlpha2Country.puertoRico: 'PR',
  ISOAlpha2Country.qatar: 'QA',
  ISOAlpha2Country.reunion: 'RE',
  ISOAlpha2Country.romania: 'RO',
  ISOAlpha2Country.russianFederation: 'RU',
  ISOAlpha2Country.rwanda: 'RW',
  ISOAlpha2Country.saintBarthelemy: 'BL',
  ISOAlpha2Country.saintHelena: 'SH',
  ISOAlpha2Country.saintKittsAndNevis: 'KN',
  ISOAlpha2Country.saintLucia: 'LC',
  ISOAlpha2Country.saintMartin: 'MF',
  ISOAlpha2Country.saintPierreAndMiquelon: 'PM',
  ISOAlpha2Country.saintVincentAndTheGrenadines: 'VC',
  ISOAlpha2Country.samoa: 'WS',
  ISOAlpha2Country.sanMarino: 'SM',
  ISOAlpha2Country.saoTomeAndPrincipe: 'ST',
  ISOAlpha2Country.saudiArabia: 'SA',
  ISOAlpha2Country.senegal: 'SN',
  ISOAlpha2Country.serbia: 'RS',
  ISOAlpha2Country.seychelles: 'SC',
  ISOAlpha2Country.sierraLeone: 'SL',
  ISOAlpha2Country.singapore: 'SG',
  ISOAlpha2Country.sintMaarten: 'SX',
  ISOAlpha2Country.slovakia: 'SK',
  ISOAlpha2Country.slovenia: 'SI',
  ISOAlpha2Country.solomonIslands: 'SB',
  ISOAlpha2Country.somalia: 'SO',
  ISOAlpha2Country.southAfrica: 'ZA',
  ISOAlpha2Country.southGeorgiaAndTheSouthSandwichIslands: 'GS',
  ISOAlpha2Country.southSudan: 'SS',
  ISOAlpha2Country.spain: 'ES',
  ISOAlpha2Country.sriLanka: 'LK',
  ISOAlpha2Country.sudan: 'SD',
  ISOAlpha2Country.suriname: 'SR',
  ISOAlpha2Country.svalbardAndJanMayen: 'SJ',
  ISOAlpha2Country.swaziland: 'SZ',
  ISOAlpha2Country.sweden: 'SE',
  ISOAlpha2Country.switzerland: 'CH',
  ISOAlpha2Country.syrianArabRepublic: 'SY',
  ISOAlpha2Country.taiwan: 'TW',
  ISOAlpha2Country.tajikistan: 'TJ',
  ISOAlpha2Country.tanzania: 'TZ',
  ISOAlpha2Country.thailand: 'TH',
  ISOAlpha2Country.timorLeste: 'TL',
  ISOAlpha2Country.togo: 'TG',
  ISOAlpha2Country.tokelau: 'TK',
  ISOAlpha2Country.tonga: 'TO',
  ISOAlpha2Country.trinidadAndTobago: 'TT',
  ISOAlpha2Country.tunisia: 'TN',
  ISOAlpha2Country.turkey: 'TR',
  ISOAlpha2Country.turkmenistan: 'TM',
  ISOAlpha2Country.turksAndCaicosIslands: 'TC',
  ISOAlpha2Country.tuvalu: 'TV',
  ISOAlpha2Country.uganda: 'UG',
  ISOAlpha2Country.ukraine: 'UA',
  ISOAlpha2Country.unitedArabEmirates: 'AE',
  ISOAlpha2Country.unitedKingdom: 'GB',
  ISOAlpha2Country.unitedStates: 'US',
  ISOAlpha2Country.unitedStatesMinorOutlyingIslands: 'UM',
  ISOAlpha2Country.uruguay: 'UY',
  ISOAlpha2Country.uzbekistan: 'UZ',
  ISOAlpha2Country.vanuatu: 'VU',
  ISOAlpha2Country.venezuela: 'VE',
  ISOAlpha2Country.vietnam: 'VN',
  ISOAlpha2Country.virginIslandsBritish: 'VG',
  ISOAlpha2Country.virginIslandsUS: 'VI',
  ISOAlpha2Country.wallisAndFutuna: 'WF',
  ISOAlpha2Country.westernSahara: 'EH',
  ISOAlpha2Country.yemen: 'YE',
  ISOAlpha2Country.zambia: 'ZM',
  ISOAlpha2Country.zimbabwe: 'ZW',
};
