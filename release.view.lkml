view: release {
  sql_table_name: musicbrainz.release ;;

  # Dimensions ########################################################################

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: country {
    sql: ${country.name} ;;
  }

  dimension: language {
    sql: ${language.name} ;;
  }

  dimension: packaging {
    sql: ${packaging.name} ;;
  }

  dimension: release_status {
    sql: ${release_status.name} ;;
  }

  dimension: year {
    sql: ${release_detail.year} ;;
    type:  date_year
  }

  # Measures ##########################################################################

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: earliest_release {
    type: min
    sql: ${release.year} ;;
    value_format: "0"
  }

  measure: latest_release {
    type: max
    sql: ${release.year} ;;
    value_format: "0"
  }

  # Hidden Fields #####################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: album_id {
    hidden: yes
    sql: ${TABLE}.release_group ;;
    type: number
  }

  dimension: language_id {
    hidden: yes
    sql: ${TABLE}.language ;;
  }

  dimension: packaging_id {
    hidden: yes
    sql: ${TABLE}.packaging ;;
  }

  dimension: release_status_id {
    hidden: yes
    sql: ${TABLE}.status ;;
  }

}
