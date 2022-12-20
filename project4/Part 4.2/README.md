
# [COP5615] DOSP Project 4-2

## Team Members
- Zhaoyang Chen (UFID: 90137235)


## Demo Link
https://youtu.be/oCu5Rd0c-XM


## How to Run
### Modules used: 
Akka  
System.Text.Json  
WebSocketSharp.Server  
### Environment:
Microsoft Visual Studio Community 2022 (64-bit) – Version 17.3.3  
Windows 10
### Run
Under the directory server, open terminal run the following:  
i.	dotnet build  
ii.	dotnet run  
b.	Same under the directory client, open terminal run the following:  
i.	dotnet build  
ii.	dotnet run  








## Test and Simulation
#### Workload Generation
```
Server
PS D:\Desktop\2022Fall\DOSP\Project\4-2\Project4.2\Server> dotnet run
-----------------------------------------------
Twitter Server started....
-----------------------------------------------
Register request: Register request: {"UserId":7894,"Password":"string","NumTweets":10}

{"UserId":12345,"Password":"string","NumTweets":10}

Logout requested through websocketID: Logout requested through websocketID: "15745b705b104f38a6a1644367efc02b"
"b2d1d4ee47454604a557d79d24f3e4e6"
Login requested through websocketID: "b10c7636474f40d58e181a06bd52f767"
Login requested through websocketID: "b26c33ff75064047a8d79abd60963cdb"
Tweet requested through websocketID: "cc451b1c7efc4077b7e15f64693c950b"
Tweet requested through websocketID: "4f65325e3f9c485286ec3394ef2ab2d7"
Tweet requested through websocketID: Tweet requested through websocketID: "cc451b1c7efc4077b7e15f64693c950b"
Tweet requested through websocketID: "cc451b1c7efc4077b7e15f64693c950b"
Tweet requested through websocketID: "cc451b1c7efc4077b7e15f64693c950b"
Tweet requested through websocketID: "cc451b1c7efc4077b7e15f64693c950b"
Tweet requested through websocketID: "4f65325e3f9c485286ec3394ef2ab2d7"
Tweet requested through websocketID: "cc451b1c7efc4077b7e15f64693c950b"
"4f65325e3f9c485286ec3394ef2ab2d7"
Tweet requested through websocketID: "4f65325e3f9c485286ec3394ef2ab2d7"
Tweet requested through websocketID: "4f65325e3f9c485286ec3394ef2ab2d7"
Tweet requested through websocketID: "4f65325e3f9c485286ec3394ef2ab2d7"
QueryMentionsTweet requested through websocketID: "2c54b7d7bae3467fbca54fbf7c0137bd"
QueryHashtagTweets requested through websocketID: "e6e33ae63b524596bc54a1be1709f1d9"
Retweet requested through websocketID: "df65f76e85f1402693afaeb37ef8f191"
Query tweets requested through websocketID: "190e35cc8509404293928f558bf48883"


Client
PS D:\Desktop\2022Fall\DOSP\Project\4-2\Project4.2\Client> dotnet run
Server Response: Server Response: {"Operation":"Register","Status":"Success","ReasonForError":"","Result":""}{"Operation":"Register","Status":"Success","ReasonForError":"","Result":""}

Register Suceeded for Register Suceeded for "Client1"

"Client2"

Server Response: {"Operation":"Logout","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Logout","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Login","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Login","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"Tweet","Status":"Success","ReasonForError":"","Result":""}
Server Response: {"Operation":"QueryMentions","Status":"Success","ReasonForError":"","Result":"[\u0022@User7894 Hi, and welcome to twitter.\u0022,\u0022@User7894 Stay safe #COVID\u0022,\u0022@User7894 Hi, and welcome to twitter.\u0022,\u0022@User7894 Stay safe #COVID\u0022]"}
Got the queryMentions result: seq
  ["@User7894 Hi, and welcome to twitter."; "@User7894 Stay safe #COVID";
   "@User7894 Hi, and welcome to twitter."; "@User7894 Stay safe #COVID"]

Server Response: {"Operation":"QueryHashTags","Status":"Success","ReasonForError":"","Result":"[\u0022#DOS rocks\u0022,\u0022#DOS rocks\u0022]"}
Got the queryHashtags result: seq ["#DOS rocks"; "#DOS rocks"]

Server Response: {"Operation":"Retweet","Status":"Success","ReasonForError":"","Result":""}
Retweet success

Server Response: {"Operation":"QueryTweets","Status":"Success","ReasonForError":"","Result":"[\u0022@User7894 Hi, and welcome to twitter.\u0022,\u0022Great day today #GreatDay\u0022,\u0022#DOS rocks\u0022,\u0022#COP5615 is the subject to take.\u0022,\u0022@User7894 Stay safe #COVID\u0022,\u0022I love tweeting\u0022,\u0022@User7894 Hi, and welcome to twitter.\u0022]"}
Got the query tweets result: seq
  ["@User7894 Hi, and welcome to twitter."; "Great day today #GreatDay";
   "#DOS rocks"; "#COP5615 is the subject to take."; ...]
```



