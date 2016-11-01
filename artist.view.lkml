view: artist {
  sql_table_name: musicbrainz.artist ;;

  # Dimensions ########################################################################

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
  }

  dimension: gender {
    sql: ${gender.name} ;;
    type: string
  }

  dimension: sort_name {
    sql: ${TABLE}.sort_name ;;
    type: string
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
