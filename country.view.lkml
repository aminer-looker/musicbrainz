view: country {
  derived_table: {
    # restrict only to country areas
    sql:
      select
        a.*
      from musicbrainz.area a
      where a.type = 1 ;;
  }

  # Dimensions ########################################################################

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  # Measures ##########################################################################

  measure: count {
    type: count
    drill_fields: [name]
  }

  # Hidden ############################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
}
