do $$
    declare
        _user city_user%rowtype;
        _tags text;
    begin
        for _user in select * from city_user
        loop
                _tags := _user.tags;
                _tags := regexp_replace(_tags, '"true"', 'true', 'g');
                _tags := regexp_replace(_tags, '"false"', 'false', 'g');
                raise notice '%', _tags;
                update city_user set tags = _tags::jsonb where one_signal_user_id = _user.one_signal_user_id;
        end loop;
    end $$
