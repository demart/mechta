package controllers;

import play.*;
import play.mvc.*;

import java.io.IOException;
import java.util.*;

import kz.mechta.models.FilterModel;
import kz.mechta.models.ProductModel;
import kz.mechta.models.ResponseWrapper;
import kz.mechta.models.StoreWrapper;
import kz.mechta.service.ParseService;
//import models.*;

public class Application extends Controller {

    public static void index() throws IOException {
    	//ResponseWrapper wrapper = new ResponseWrapper();
    	//FilterModel model = ParseService.parseFilte(1);
    	//wrapper.data = model;
    	render();
    }
    
    

}