view: artist {
  sql_table_name: musicbrainz.artist ;;

  # Dimensions ########################################################################

  dimension: name {
    sql: ${TABLE}.name ;;
  }

  dimension: country {
    sql: ${country.name} ;;
  }

  dimension: gender {
    sql: ${gender.name} ;;
  }

  dimension: sort_name {
    sql: ${TABLE}.sort_name ;;
  }

  dimension: type {
    sql: ${artist_type.name} ;;
  }

  # Measures ##########################################################################

  measure: count {
    type: count
    drill_fields: [name]
  }

  # Hidden Fields #####################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension: country_id {
    hidden: yes
    sql: ${TABLE}.begin_area ;;
  }

  dimension: gender_id {
    hidden: yes
    sql: ${TABLE}.gender ;;
  }

  dimension: type_id {
    hidden: yes
    sql: ${TABLE}.type ;;
    type: number
  }
}
