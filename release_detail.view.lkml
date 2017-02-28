view: release_detail {
  derived_table: {
    sql: SELECT *
        FROM musicbrainz.release_country
        union all
        select release, null as country, date_year, date_month, date_day
        from musicbrainz.release_unknown_country
       ;;
    sql_trigger_value: select current_date ;;
    indexes: ["country", "release"]
  }

  # Dimensions ########################################################################

  dimension: year {
    sql: to_date(to_char(${TABLE}.date_year, '0000'), 'YYYY') ;;
  }

  # Hidden Fields #####################################################################

  dimension: country_id {
    hidden: yes
    sql: ${TABLE}.country ;;
  }

  dimension: id {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.release || ${TABLE}.country || ${TABLE}.date_year || ${TABLE}.date_month || ${TABLE}.date_day ;;
    type: string
  }

  dimension: release_id {
    hidden: yes
    sql: ${TABLE}.release ;;
    type: number
  }
}
