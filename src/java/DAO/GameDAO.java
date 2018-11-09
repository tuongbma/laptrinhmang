/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import java.util.Random;
import utils.DBConnection;

/**
 *
 * @author phantuan
 */
public class GameDAO  {

    public GameDAO() {

    }

    public int[][] createMap(String key, int size) {
        ArrayList<Integer> list = new ArrayList<Integer>();
        for (int i = 1; i <= size*size; i++) {
            list.add(i);
        }
        int[][] map = new int[size][size];

        while(key.length() < size*size){
            key += key;
        }
        for (int i = 0; i < size; i++) {
            String s = "";
            for (int j = 0; j < size; j++) {
                int c = (int) key.charAt(i*size + j);
                int index = c % list.size();
                map[i][j] = list.get(index);
                list.remove(index);
                s += "-" + map[i][j];
            }
            System.out.println(s);
        }

        return map;
    }
    public void saveResult(String user1, String user2, String winUser, int timePlay){
       
    }
}
