//1. Вывести ко-во незаблокированных юзеров не из Germany
db.users.countDocuments(
    {country: {$ne: 'Germany'}, is_blocked: null}
        )

// 2. Вывести имена юзеров не из Germany
db.users.find(
    {country: {$ne: 'Germany'}},
    {fullname:1, _id:0}

//3. Уменьшить баланс заблокированных юзеров на 5%
db.users.updateMany(
{is_blocked:true},
     { $mul: { balance: 0.95 }}
        )

// 4. Вывести название треков продолжительностью от 1 до 10 мин
db.tracks.find(
    {duration_secs: {$gte: 60, $lte: 600}},
    {title:1, _id:0}
        )

//5. Разблокировать юзеров из France
db.users.updateMany(
    {country: 'France'},
    { $unset: { is_blocked: null } }
)
