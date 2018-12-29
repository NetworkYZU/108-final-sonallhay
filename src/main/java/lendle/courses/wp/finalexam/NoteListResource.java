/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lendle.courses.wp.finalexam;

import java.util.Arrays;
import java.util.List;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author lendle
 */
@Path("notes")
public class NoteListResource {
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<NoteHeader> getNotes(){
        return NoteDB.getNoteHeaders();
    }
}
