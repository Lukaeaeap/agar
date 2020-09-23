float raycasty; 
float raycastx;
void raycast(float playposx,float playposy,float t1x,float t1y){
  float mousedistx=playposy-t1x;
  float mousedisty=playposx-t1y;
  if(mousedistx>0){
    if(mousedisty>0){
      raycasty=(mousedistx/(mousedisty+mousedistx));
      raycastx=(mousedisty/(mousedisty+mousedistx));
    }else if (mousedisty<0){
      raycasty=(mousedistx/((mousedisty*-1)+mousedistx));
      raycastx=(((mousedisty*-1)/((mousedisty*-1)+mousedistx))*-1);
    }
  }else if (mousedistx<0){
    if(mousedisty>0){
      raycasty=(((mousedistx*-1)/(mousedisty+(mousedistx*-1)))*-1);
      raycastx=(mousedisty/(mousedisty+(mousedistx*-1)));
    }else if (mousedisty<0){
      raycasty=((mousedistx/(mousedisty+mousedistx))*-1);
      raycastx=((mousedisty/(mousedisty+mousedistx))*-1);
    }
  }
}
