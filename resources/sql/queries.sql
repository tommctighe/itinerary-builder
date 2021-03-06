-- :name get-events :? :*
-- :doc selects all events given user-selected filters, I imagine this is really slow for big lists
SELECT DISTINCT events.name, events.id, month, dates, date, city, state, country, book_name 
FROM events, books, event_to_books
WHERE events.id=events.id AND events.id = event_to_books.event_id AND event_to_books.book_id = books.id 
   --~ (if (seq (:region params)) " AND region IN (:v*:region)")
   --~ (if (seq (:month params)) " AND month IN (:v*:month)")
   --~ (if (seq (:book params)) " AND book_name IN (:v*:book)")
ORDER BY date

-- :name get-regions :? :*
-- :doc selects regions
SELECT DISTINCT region FROM events ORDER BY region DESC

-- :name get-books :? :*
-- :doc selects distinct books
SELECT book_name FROM books ORDER BY book_name