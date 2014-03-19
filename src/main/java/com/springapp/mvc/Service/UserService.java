package com.springapp.mvc.Service;

import com.springapp.mvc.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;


public class UserService {
    @Autowired
    MongoTemplate mongoTemplate;

    public static final String COLLECTION_NAME = "users";

    public void addUser(User u){

        if(!mongoTemplate.collectionExists(User.class))
            mongoTemplate.createCollection(User.class);

        u.setId(UUID.randomUUID().toString());
        mongoTemplate.insert(u,COLLECTION_NAME);

    }
    public List<User> getAll(){

        return mongoTemplate.findAll(User.class,COLLECTION_NAME);
    }
    public void updateUser(User u) {
        Update update=new Update();
        update.set("name",u.getName())   ;
        update.set("lastname",u.getLastname())   ;
        update.set("cell",u.getCell())   ;
        Query q=new Query();
        q.addCriteria(Criteria.where("id").is(u.getId()))  ;

        mongoTemplate.findAndModify(q,update,User.class,COLLECTION_NAME);
    }
    public void deleteUser(User u) {


        mongoTemplate.remove(u, COLLECTION_NAME);
    }

}
