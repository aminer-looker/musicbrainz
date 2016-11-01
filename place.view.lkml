view: place {
  sql_table_name: musicbrainz.place ;;

  # Dimensions ########################################################################

  dimension: address {
    sql: ${TABLE}.address ;;
    type: string
  }

  dimension: coordinates {
    sql: ${TABLE}.coordinates ;;
    type: string
  }

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
  }

  dimension: type {
    sql: ${place_type.name} ;;
  }

  # Measures ##########################################################################

  measure: count {
    type: count
  }

  # Hidden Fields #####################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension: type_id {
    hidden: yes
    sql: ${TABLE}.type ;;
    type: number
  }
}
