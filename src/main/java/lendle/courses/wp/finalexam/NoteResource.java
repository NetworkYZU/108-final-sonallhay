/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.wp.finalexam;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author lendle
 */
@Path("note")
public class NoteResource {
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Note getNote(@PathParam("id") String id){
        return NoteDB.getNote(id);
    }
    
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public void addNote(Note note){
        NoteDB.addNote(note);
    }
    
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    public void editNote(Note note){
        NoteDB.editNote(note);
    }
    
    @DELETE
    @Path("/{id}")
    public void deleteNote(@PathParam("id") String id){
        NoteDB.deleteNote(id);
    }
}
