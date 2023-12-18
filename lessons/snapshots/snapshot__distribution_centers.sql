{% snapshot snapshot__distribution_centers %}

{# tell it what attributes to track change on #}
{{
    config(
      target_schema='dbt_snapshots',
      unique_key='id',
      strategy='check', 
      check_cols=['name', 'latitude', 'longitude']
    )
}}

SELECT * FROM {{ source('thelook_ecommerce', 'distribution_centers') }}

{% endsnapshot %}