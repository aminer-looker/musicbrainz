view: work {
  # There are works which represent parts of other works (e.g., movements of a
  # symphony), so we use this derived table definition to only select those which are
  # "top-level" works themselves.
  derived_table: {
    sql:
      select
        w.*
      from musicbrainz.work w
      left join musicbrainz.l_work_work lww on lww.entity1 = w.id
      where lww.id is null ;;
  }

  # Dimensions ########################################################################

  dimension: composed_year {
    sql: to_timestamp(${composing_link.begin}, 'YYYY') ;;
    type: date_year
  }

  dimension: language {
    sql: ${language.name} ;;
  }

  dimension: name {
    sql: ${TABLE}.name ;;
    type: string
  }

  dimension: type {
    sql: ${work_type.name} ;;
  }

  # Measures ##########################################################################

  measure: count {
    drill_fields: [basic_drill_set*]
    type: count
  }

  measure: earliest_year {
    type: min
    sql: ${composed_year} ;;
  }

  measure: latest_year {
    type: max
    sql: ${composed_year} ;;
  }

  set: basic_drill_set {
    fields: [name, type, composed_year]
  }

  # Hidden Fields #####################################################################

  dimension: id {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.id ;;
    type: number
  }

  dimension: language_id {
    hidden: yes
    sql: ${TABLE}.language ;;
  }

  dimension: type_id {
    hidden: yes
    sql: ${TABLE}.type ;;
    type: number
  }
}
