package com.handheld;

import java.util.ArrayList;
import java.util.Map;

public interface  BarcodeListener {
    void onRead(String tagsJson);
    void onConnect(boolean isConnected,int powerLevel);

}
