Echo "JWT token valid upto 14 Aug 8pm"
TOKEN="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Host Address"
HOST="ak-bank.herokuapp.com"

Echo "Bank API fetching list of all bank"
curl "http://ak-bank.herokuapp.com/bank/details/?limit=10&offset=200"  -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Details API demonstraing Limit set to 0 and Offset. Limit and offset will not be consirdered, it same as if limit and offset are not given"
curl "http://ak-bank.herokuapp.com/bank/details/?limit=0&offset=40" -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Details API demonstraing Limit and Offset"
curl "http://ak-bank.herokuapp.com/bank/details/?limit=10&offset=200" -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Details API demonstraing Limit and offset set to 0"
curl "http://ak-bank.herokuapp.com/bank/details/?limit=10&offset=0" -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Details API demonstraing Limit and Offset not given"
curl "http://ak-bank.herokuapp.com/bank/details/?limit=10" -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Fetch Detials using IFSC code of bank (exact match)"
curl "http://ak-bank.herokuapp.com/bank/ifsc/?ifsc=ANDB0000235" -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Fetch List of branches using name and city of bank (exact match)"
curl "http://ak-bank.herokuapp.com/bank/branch/?bank_name=ABHYUDAYA%%20COOPERATIVE%%20BANK%%20LIMITED&city=MUMBAI" -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"

Echo "Fetch List of branches using name and city of bank (exact match) along with limit and offset"
curl "http://ak-bank.herokuapp.com/bank/branch/?bank_name=ABHYUDAYA%%20COOPERATIVE%%20BANK%%20LIMITED&city=MUMBAI&limit=10&offset=20" -H "Accept: application/json" -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTY1Nzk1OTEyLCJqdGkiOiIxZGFhZjgxMGNhNDc0MDIxYTA4OTljNzc3YmExNDA5MyIsInVzZXJfaWQiOjF9.y4uUEkzLIpp_i_JL_p7B_CM0HUv3cGjpPG6Y6v2DjLQ"